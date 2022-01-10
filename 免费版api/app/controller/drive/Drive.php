<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/8/29 0029
 * Time: 13:15
 */

namespace app\controller\drive;


use app\model\Plan;
use ruhua\bases\BaseController;
use app\model\Driver as DriveModel;
use app\model\Plan as PlanModel;

class Drive extends BaseController
{

    /**司机登录
     * @return mixed
     */
    public static function login($data)
    {
      //  $post=input('post.');
        $res=DriveModel::login($data);
        return $res;

    }

    /**
     *司机获取配送订单
     */
    public function get_trans_plan()
    {
        $uid=4;
        $res=PlanModel::where(['did'=>$uid])->order('is_sign asc')->select();
        return app('json')->go($res);
    }

    /**获取个人信息
     * @return mixed
     */
    public function get_infor()
    {
        $uid=4;
        $res=DriveModel::with(['head','fleets','car'])->where('id',$uid)->find();
        return app('json')->go($res);
    }

    /**修改个人信息
     * @return mixed
     */
    public function update_infor()
    {
        $data=input('post.');
        $uid=4;
        $res=DriveModel::update($data,['id'=>$uid]);
        return app('json')->go($res);
    }

}