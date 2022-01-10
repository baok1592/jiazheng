<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/8/29 0029
 * Time: 15:14
 */

namespace app\controller\admin;


use app\service\TokenService;
use ruhua\bases\BaseController;
use app\model\Car as CarModel;
use ruhua\exceptions\BaseException;
use app\model\Driver as DriveerModel;
use app\model\CarFeeAppli as CarFeeAppliModel;
use think\facade\Db;
use app\model\Plan as PlanModel;
use think\facade\Log;
use app\model\Equip as EquipModel;



class Car extends BaseController
{
    /**添加车辆
     * @return mixed
     * @throws BaseException
     */
    public function add_car()
    {
        $data=input('post.');
        $rule=[
          'car_num'=>'require',
            'drive_name'=>'require',
            'mobile'=>'require',
        ];
        $aid=TokenService::getCurrentTokenAid();
        $data['operator']=$aid;
        $this->validate($data,$rule);
        $list=CarModel::with('operators')->where('car_num',$data['car_num'])->find();
        if($list){
            throw new BaseException(['msg'=>'车牌已存在']);
        }
        if(isset($data['equip_num']))
            unset($data['equip_num']);
        $res=CarModel::create($data);
        return app('json')->go($res);
    }

    /**删除车辆
     * @param $id
     * @return mixed
     */
    public function del_car($id)
    {
        $res=CarModel::destroy($id);
        return app('json')->go($res);
    }

    /**更新车辆
     * @return mixed
     * @throws BaseException
     */
    public function update_car()
    {
        $data=input('post.');
        $rule=[
            'car_num'=>'require',
            'drive_name'=>'require',
            'mobile'=>'require',
        ];
        if(isset($data['create_time']))
            unset($data['create_time']);
        $this->validate($data,$rule);
        $list=CarModel::where('id',$data['id'])->find();
        if(!$list){
            throw new BaseException(['msg'=>'车辆不存在']);
        }
        $res=$list->save($data);
        return app('json')->go($res);
    }

    /**获取所有车辆
     * @return mixed
     */
    public function get_all_car($id="",$start="",$end="")
    {

        if($id==""){
            $list=CarModel::with('operators')->order('create_time desc')->select();

            if($start!=""&&$end!=""){
                $end.=" 23:59:59";
                $list=CarModel::with('operators')-> whereTime('create_time','between',[$start,$end])->order('create_time desc')->select();
            }


            Db::startTrans();

            try {

                foreach ($list as $k=>$v){

                    $plan=PlanModel::where(['car_id'=>$v['id'],'status'=>[1,2]])->find();
                    if($plan&&isset($plan['dd_json']['yk_money'])){
                        $yk=$plan['dd_json']['yk_money'];
                    }
                    else{
                        $yk=0;
                    }
                    $v['yk_money']=$yk;
                    $list[$k]=$v;

                }
                Db::commit();
            }catch (\Exception $e) {
                Db::rollback();
                Log::error($e->getMessage());
                return false;
            }
        }else{
            $list=CarModel::with('operators')->where('id',$id)->find();
            $plan=PlanModel::where(['car_id'=>$id,'status'=>[1,2]])->find();
            if($plan&&isset($plan['dd_json'])){
                $yk=$plan['dd_json']['yk_money'];
            }
            else{
                $yk=0;
            }
            $list['yk_money']=$yk;

        }

        return app('json')->go($list);
    }


    /**车辆费用申报
     * @return mixed
     */
    public function add_car_fee_appli()
    {
        $data=input('post.');
        $rule=[
            'car_id'=>'require',
            'type'=>'require',
            'fee'=>'require',
        ];
        $uid=CarModel::where('id',$data['car_id'])->value('uid');
        $this->validate($data,$rule);
        $carlsit=CarModel::where('id',$data['car_id'])->find();
        if(!$carlsit){
            throw new BaseException(['msg'=>'车辆信息错误']);
        }
        $data['uid']=$uid;
        $res=CarFeeAppliModel::create($data);
        return app('json')->go($res);
    }

    /**设备绑定
     * @param $id
     * @param $num
     */
    public function bind_equip($id,$num)
    {
        $car=CarModel::where('id',$id)->find();
        if(!$car){
            throw new BaseException(['msg'=>'车辆不存在']);
        }
        $equip=CarModel::where(['car_num'=>$num])->find();
        if($equip){
            throw new BaseException(['msg'=>'设备已绑定在其他车辆上']);
        }

        $res=$car->save(['car_num'=>$num]);
        return app('json')->go($res);
    }

    public function cancel_equip($id)
    {
        $car=CarModel::find($id);
        if(!$car)
            throw new BaseException(['msg'=>'车辆错误']);
        $num=$car['equip_num'];
        $res=$car->save(['equip_num'=>'']);
        EquipModel::update(['bind_car'=>0],['num'=>$num]);
        return app('json')->go($res);
    }

    /**
     * 上传经纬度(测试)
     */
    public function upddate_position()
    {
        $data=input('post.');
        $res=CarModel::update($data,['id'=>$data['id']]);
        return app('json')->go($res);
    }

    /**
     * 获取车辆经纬度
     */
    public function get_car_position($id="")
    {
        if($id=="")
            $data=CarModel::with('plan')->where('equip_num','<>',null)->field('id,car_num,drive_name,mobile,position')->select();
        else
            $data=CarModel::with('plan')->where('equip_num','<>',null)->where('id',$id)->field('id,car_num,drive_name,mobile,position')->select();
        foreach ($data as $k=>$v){
            $plan=$v['plan'];
            $str="";
            if(count($plan)>0){
                foreach ($plan as $key=>$v){
                    if($v['order_num']!='')
                        $str.=$v['order_num'].",";
                }
                $str=substr($str,0,strlen($str)-1);
            }
            $data[$k]['order_str']=$str;
            unset($data[$k]['plan']);
        }
        return app('json')->go($data);
    }











}