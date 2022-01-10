<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/16 0016
 * Time: 14:55
 */

namespace app\controller\admin;


use app\controller\map\Terminal;
use app\service\TokenService;
use ruhua\bases\BaseController;
use app\model\Equip as EquipModel;
use ruhua\exceptions\BaseException;
use app\model\Car as CarModel;
use think\facade\Log;

class Equip extends BaseController
{
    /**添加设备
     * @return mixed
     * @throws BaseException
     */
    public function add()
    {
        $data=input('post.');
        $rule=[
            'num'=>'require'
        ];
        $equip=EquipModel::where('num',$data['num'])->find();
        if($equip){
            throw new BaseException(['msg'=>'设备已存在']);
        }
        $this->validate($data,$rule);
        $data['operator']=TokenService::getCurrentTokenAid();
        $map=new Terminal();
        $tids=$map->create_terminal($data['num'],$data['num']);
        $data['tid']=$tids['data']['tid'];
        $res=EquipModel::create($data);


        return app('json')->go($res);
    }

    /**设备绑定车辆
     * @param $id
     * @param $cid
     * @return mixed
     * @throws BaseException
     */
    public function bind_car($id,$cid)
    {
        $equip=EquipModel::find($id);
        $car=CarModel::find($cid);
        if(!$equip)
            throw new BaseException(['msg'=>'设备不存在']);
        if(!$car)
            throw new BaseException(['msg'=>'车辆不存在']);

        if($equip['bind_car']>0)
            throw new BaseException(['msg'=>'设备已绑定车辆']);
        if($car['equip_num']!='')
            throw new BaseException(['msg'=>'车辆已绑定设备']);
        $res=$equip->save(['bind_car'=>$cid,'operator'=>TokenService::getCurrentTokenAid()]);
        $car->save(['equip_num'=>$equip['num'],'is_bind'=>1]);
        return app('json')->go($res);
    }


    /**删除设备
     * @param $id
     */
    public function del_equip($id)
    {
        $equip=EquipModel::find($id);
        if(!$equip)
            throw new BaseException(['msg'=>'设备错误']);
        $car=CarModel::where('equip_num',$equip['num'])->find();
        if($car)
            throw new BaseException(['msg'=>'设备已绑定车辆，请先解绑']);
        $map=new Terminal();
        $map->delete_terminal($equip['tid']);
        $res=$equip->delete();
        return app('json')->go($res);
    }

    public function update_eq($id,$num)
    {
        $equip=EquipModel::find($id);
        $res=EquipModel::update(['num'=>$num],['id'=>$id]);
        CarModel::update(['equip_num'=>$num],['equip_num'=>$equip['num']]);
        return app('json')->go($res);


    }

    /**
     * 解除绑定
     * @param $id 设备id
     */
    public function cancel_bind($id)
    {
        $equip=EquipModel::find($id);
        $car=CarModel::update(['equip_num'=>null,'is_bind'=>0],['equip_num'=>$equip['num']]);
        $res=$equip->save(['bind_car'=>0]);
        return app('json')->go($res);
    }

    public function update_equip($id,$cid)
    {
        $equip=EquipModel::find($id);
        if(!$equip){
            throw new BaseException(['msg'=>'错误']);
        }
        $oldcar=CarModel::where('equip_num',$equip['num'])->find();

        $newcar=CarModel::find($cid);
        if(!$oldcar||!$newcar)
            throw new BaseException(['msg'=>'错误']);
        if($newcar['is_bind']==1)
            throw new BaseException(['msg'=>'该车辆已绑定设备']);
        Log::error("00");
        $oldcar->save(['equip_num'=>null,'is_bind'=>0]);
        Log::error("11");
        $res=$newcar->save(['equip_num'=>$equip['num'],'is_bind'=>1]);
        Log::error("22");
        return app('json')->go($res);
    }

    public function get_type($start="",$end="")
    {

        $res=EquipModel::with(['car','operators'])->order('create_time desc')->select();
        if($start!=""&&$end!=""){
            $end.=" 23:59:59";
            $res=EquipModel::with(['car','operators'])->whereTime('create_time','between',[$start,$end])->order('create_time desc')->select();
        }
        return app('json')->go($res);
    }


}