<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/8/29 0029
 * Time: 11:23
 */

namespace app\controller\admin;


use app\controller\common\Common;
use app\service\TokenService;
use ruhua\bases\BaseController;
use app\model\Admin as AdminModel;
use app\model\AuthGroupRule;
use app\model\AuthGroup as AuthGroupModel;
class Admin extends BaseController
{
    /**
     * 管理员登录
     */
    public function login()
    {
        $post=input('post.');
        $res=AdminModel::login($post);
        return app('json')->go($res);
    }

    /**绑定电话号码
     * @param $mobile
     * @param $code
     */
    public function bind_mobile($mobile,$code)
    {
        $res=Common::checkCode($mobile,$code);
        $aid=1;
        $res=AdminModel::where('id',$aid)->update(['mobile'=>$mobile]);
        return app('json')->go($res);
    }

    /**
     * 管理员手机验证登录
     */
    public static function mobile_login($data)
    {
       // $post=input('post.');
        $res=AdminModel::mobile_login($data);
        return $res;
    }

    /**
     * 管理员修改个人信息
     */
    public function update_infor()
    {
        $data=input('post.');
        $uid=3;
        $res=AdminModel::update($data,['id'=>$uid]);
        return app('json')->go($res);
    }

    /**查看个人信息
     * @return mixed
     */
    public function get_infor()
    {
        $uid=3;
        $res=AdminModel::where('id',$uid)->withoutField('password,group_id,ip')->find();
        return app('json')->go($res);
    }

    /**更新用户密码
     * @return mixed
     */
    public function update_password()
    {

       $data=input('post.');
        $rule=[
            'old_psw'=>'require',
            'new_psw'=>'require',
            're_psw'=>'require'
        ];
        $this->validate($data,$rule);
        $res=AdminModel::update_psw($data);
        return app('json')->go($res);
    }

    /**
     * 获取用户个人权限
     */
    public function get_admin_auth()
    {
        $group=TokenService::getCurrentTokenGroup();
        $groups=AuthGroupModel::find($group);;
        $rule=AuthGroupRule::where('id','in',$groups['rules']['rule_id'])->select();
        return app('json')->go($rule);
    }
}