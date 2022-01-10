<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/5 0005
 * Time: 10:19
 */

namespace app\controller\user;


use app\controller\common\Common;
use app\service\TokenService;
use ruhua\bases\BaseController;


class User extends BaseController
{
    public static function login($data)
    {
        //$data=input('post.');
        $yz=Common::checkCode($data['mobile'],$data['code']);
        if($yz){
            $res=(new TokenService())->saveCache($data);
            return $res;
        }
        return null;
    }

}