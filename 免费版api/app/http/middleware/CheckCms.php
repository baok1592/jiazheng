<?php

/**
 * 如花商城系统
 * =========================================================
 * 官方网址：http://www.ruhuashop.com
 * QQ 交流群：728615087
 * Version：1.2.0
 */

namespace app\http\middleware;

//中间件，验证token，检测权限

use app\service\TokenService;
use ruhua\exceptions\TokenException;
use think\facade\Log;
use think\facade\Request;
use ruhua\exceptions\BaseException;

class CheckCms
{
    public function handle($request, \Closure $next)
    {

        $url=Request::url();
        $rule=TokenService::getCurrentTokenRule();
        $login_time=TokenService::getCurrentLoginTime();
        $time=time();
        if($time-$login_time>7200)
            throw new TokenException(['msg'=>'登录已过期']);
        $flg=0;
        foreach ($rule as $k=>$v){

            $rule=$v['rule'];
            if(is_array($rule)){
                foreach ($rule as $key=>$val){
                    if($val['route']==$url||strstr($url,$val['route'])==true){
                        $flg=1;
                        break;
                    }

                }
            }
            if($flg==1)
                break;
        }
        if($flg==0){
           //throw new BaseException(['msg'=>'没有权限']);
        }else{
            return $next($request);
        }
        return $next($request);
        return app('json')->fail('没有权限');
    }
}