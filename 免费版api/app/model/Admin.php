<?php
declare (strict_types = 1);

namespace app\model;

use app\controller\common\Common;
use app\service\TokenService;
use ruhua\bases\BaseModel;
use ruhua\exceptions\BaseException;
use app\model\Mobile as MobileModel;
use app\model\AuthGroup as AuthGroupModel;
use think\facade\Log;


class Admin extends BaseModel
{
    public static function login($data)
    {
        $data['password']=(new Common())->password($data['password']);
        $dt=[
            'mobile'=>$data['mobile'],
            'password'=>$data['password']
        ];

        $user=self::where($dt)->find();
        if(!$user){
            throw new BaseException(['msg'=>'账号或密码错误']);
        }
        if ($user['state'] == 1) {
            throw new BaseException(['msg'=>'已禁用']);
        }
        $group=AuthGroupModel::find($user['group_id']);
        $rule=AuthGroupRule::where('id','in',$group['rules']['rule_id'])->select();
        $data=[
            'admin_id'=>$user['id'],
            'group'=>$user['group_id'],
            'username'=>$user['username'],
            'rule'=>$rule,
            'login_time'=>time()
        ];

        $res=(new TokenService())->saveCache($data);
        return ['token'=>$res,'rule'=>$rule];
    }



    public static function mobile_login($data)
    {
        $res=Common::checkCode($data['mobile'],$data['code']);


        $admin=self::select();
        if(count($admin)==0){
            $mobile=MobileModel::where(['mobile'=>$data['mobile']])->find();
            if($mobile){
                throw new BaseException(['msg'=>'号码已存在']);
            }
            MobileModel::create(['mobile'=>$data['mobile'],'type'=>0]);
            $data=[
                'username'=>'管理员',
                'group_id'=>1,
                'mobile'=>$data['mobile'],
            ];
            self::create($data);
        }

        if(!$res)
        {
            throw new BaseException(['msg'=>'账号或密码错误']);
        }
        $user=self::where('mobile',$data['mobile'])->find();
        if(!$user){
            throw new BaseException(['msg'=>'号码不存在']);
        }
        if ($user['state'] == 1) {
            throw new BaseException(['msg'=>'已禁用']);
        }
        $data=[
            'admin_id'=>$user['id'],
            'group'=>$user['group'],
            'username'=>$user['username']
        ];
        $res=(new TokenService())->saveCache($data);
        $user->save(['code'=>$res]);
        return $res;
    }

    public static function update_psw($data)
    {
        $rule=[
            'old_psw'=>'require',
            'new_psw'=>'require',
            're_psw'=>'require'
        ];
        if($data['new_psw']!=$data['re_psw']){
            throw new BaseException(['msg'=>'两次输入的密码不一致']);
        }
        $aid=TokenService::getCurrentTokenAid();
        $admin=self::find($aid);
        if($admin['password']!=(new Common())->password($data['old_psw']))
            throw new BaseException(['msg'=>'原密码错误']);
        return $admin->save(['password'=>(new Common())->password($data['new_psw'])]);


    }
}
