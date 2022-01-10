<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/8/29 0029
 * Time: 13:40
 */

namespace app\controller\business;


use ruhua\bases\BaseController;
use app\model\Business as BudinessModel;

class Business extends BaseController
{

    /**登录
     * @return mixed
     */
    public static function login($data)
    {
      //  $post=input('post.');
        $res=BudinessModel::login($data);
        return $res;
    }

    /**
     * 获取个人信息
     */
    public function get_infor()
    {
        $uid=1;
        $res=BudinessModel::where('id',$uid)->find();
        return app('json')->go($res);
    }

    /**
     * 修改个人信息
     */
    public function update_infor()
    {
        $data=input('post.');
        $uid=1;
        $res=BudinessModel::update($data,['id'=>$uid]);
        return app('json')->go($res);
    }
}