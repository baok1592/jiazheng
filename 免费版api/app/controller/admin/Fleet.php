<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/8/31 0031
 * Time: 15:04
 */

namespace app\controller\admin;


use ruhua\bases\BaseController;
use app\model\Fleet as  FleetModel;
use ruhua\exceptions\BaseException;
use app\model\Driver as DriverModel;

class Fleet extends BaseController
{

    /**添加车队
     * @return mixed
     * @throws BaseException
     */
    public function add()
    {
        $data=input('post.');
        $rule=[
            'name'=>'require'
        ];
        $this->validate($data,$rule);
        $list=FleetModel::where('name',$data['name'])->find();
        if($list){
            throw new BaseException(['msg'=>'车队已存在']);
        }
        $res=FleetModel::create($data);
        return app('json')->go($res);
    }

    /**更新车队
     * @param $id
     * @param $name
     * @return mixed
     * @throws BaseException
     */
    public function update($id,$name)
    {
        $list=FleetModel::where('name',$name)->find();
        if($list)
            if($id!=$list['id']){
                throw new BaseException(['msg'=>'车队已存在']);
            }
        $res=FleetModel::update(['name'=>$name],['id'=>$id]);
        return app('json')->go($res);
    }

    /**获取车队信息
     * @return mixed
     */
    public function get()
    {
        $list=FleetModel::select();
        return app('json')->go($list);
    }

    /**删除车队信息
     * @param $id
     * @return mixed
     * @throws BaseException
     */
    public function del($id)
    {
        $list=DriverModel::where('fleet',$id)->find();
        if($list){
            throw new BaseException(['msg'=>'有司机在车队，无法删除']);
        }
        $res=FleetModel::destroy($id);
        return app('json')->go($res);
    }

    /**添加车队成员
     * @param $id
     * @param $uid
     */
    public function add_user($id,$uid)
    {
        $driver=DriverModel::where('id',$uid)->find();
        if(!$driver){
            throw new BaseException(['msg'=>'司机不存在']);
        }
        $fleet=FleetModel::where('id',$id)->find();
        if(!$fleet){
            throw new BaseException(['msg'=>'车队不存在']);
        }
        $res=$driver->save(['fleet'=>$id]);
        return app('json')->go($res);
    }

    /**删除车队成员
     * @param $uid
     */
    public function del_user($uid)
    {
        $driver=DriverModel::where('id',$uid)->find();
        if(!$driver){
            throw new BaseException(['msg'=>'司机不存在']);
        }
        $res=$driver->save(['fleet'=>0]);
        return app('json')->go($res);
    }

    /**id获取车队成员
     * @param $id
     */
    public function get_driver_fid($id)
    {
        $res=DriverModel::where('fleet',$id)->select();
        return app('json')->go($res);
    }


}