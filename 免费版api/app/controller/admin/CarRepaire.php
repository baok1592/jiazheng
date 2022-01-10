<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/16 0016
 * Time: 10:05
 */

namespace app\controller\admin;


use app\service\TokenService;
use ruhua\bases\BaseController;
use app\model\CarRepair as CarRepairModel;
use app\model\Car as CarModel;
use ruhua\exceptions\BaseException;
use app\model\Admin as AdminModel;

/**维修开单
 * Class CarRepaire
 * @package app\controller\admin
 */
class CarRepaire extends BaseController
{
    public function add()
    {
        $data=input('post.');
        $rule=[
            'json'=>'require',
        ];
        $this->validate($data,$rule);
        $data['kd_user']=TokenService::getCurrentTokenAid();
        $user=AdminModel::find($data['kd_user']);
        $data['json']['kd_user']=$user['username'];
        $res=CarRepairModel::create($data);
        return app('json')->go($res);
    }

    public function update()
    {
        $data=input('post.');
        $rule=[
            'json'=>'require',
        ];
        $this->validate($data,$rule);
        $res=CarRepairModel::update($data,['id'=>$data['id']]);
        return app('json')->go($res);
    }

    public function get($id="",$start="",$end="")
    {
        if($id=="")
            $res=CarRepairModel::with('kduser')->order('create_time desc')->select();
        else
            $res=CarRepairModel::with('kduser')->where('id',$id)->find();
        if($start!=""&&$end!=""){
            $end.=" 23:59:59";
            $res=CarRepairModel::with('kduser')-> whereTime('create_time','between',[$start,$end])->order('create_time desc')->select();
        }

        return app('json')->go($res);
    }

    public function del($id)
    {
        $res=CarRepairModel::destroy($id);
        return app('json')->go($res);
    }
}