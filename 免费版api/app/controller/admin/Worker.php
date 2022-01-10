<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/7 0007
 * Time: 9:40
 */

namespace app\controller\admin;


use ruhua\bases\BaseController;
use app\model\Worker as WorkerModel;
use app\controller\common\Common;

class Worker extends BaseController
{
    public function add_work()
    {
        $data=input('post.');
        $rule=[
            'mobile'=>'require',
            'name'=>'require',
            'idcard'=>'require',
            'work'=>'require',
            'department'=>'require',
        ];
        Common::check_mobile($data['mobile']);
        $data['workname']=$this->choose_work($data['work']);
        $this->validate($data,$rule);
        $res=WorkerModel::create($data);
        if($res){
            Common::add_mobile($data['mobile'],4);
        }
        return app('json')->go($res);
    }

    public function choose_work($type)
    {
        switch ($type){
            case 0:
                return "调度员";
            case 1:
                return "油站管理员";
            default:
                return "会计";
        }
    }


    /**更新部门管理员信息
     * @return mixed
     */
    public function update_work()
    {
        $data=input('post.');
        $rule=[
            'mobile'=>'require',
            'name'=>'require',
            'idcard'=>'require',
            'work'=>'require',
            'department'=>'require',
        ];
        $data['workname']=$this->choose_work($data['work']);
        $this->validate($data,$rule);
        $res=WorkerModel::update($data,['id'=>$data['id']]);
        return app('json')->go($res);
    }

    /**获取所有部门管理员
     * @return mixed
     */
    public function get_worker()
    {
        $res=WorkerModel::select();
        return app('json')->go($res);
    }


    /**产出
     * @param $id
     * @return mixed
     */
    public function del_worker($id)
    {
        $res=WorkerModel::destroy($id);
        return app('json')->go($res);
    }

}