<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/5 0005
 * Time: 15:21
 */

namespace app\http\middleware;


use app\service\TokenService;
use ruhua\exceptions\BaseException;
use think\facade\Log;
use think\facade\Request;
use app\model\AuthGroupRule as AuthGroupRuleModel;
use app\model\AuthRule as AuthRuleModel;
use app\model\Admin as AdminModel;

class CheckAuth
{
    public function handle($request, \Closure $next)
    {
        $uid=TokenService::getCurrentTokenUid();
        $group=TokenService::getCurrentTokenGroup();
        $user=AdminModel::where(['id'=>$uid,'group_id'=>$group])->find();

        if(!$user){
            throw new BaseException(['msg'=>'错误']);
        }
        $url=Request::url();
        $rule_id=AuthRuleModel::where('name',$url)->value('id');
        $rule=AuthGroupRuleModel::where(['group'=>$group,'rule'=>$rule_id])->find();
        Log::error("rule");
        Log::error($group);
        Log::error($uid);
        Log::error($url);
        Log::error("rule");
        if(!$rule){
            throw new BaseException(['msg'=>'没有权限']);
        }
        return $next($request);
    }
}