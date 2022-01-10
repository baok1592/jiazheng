<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/5 0005
 * Time: 13:27
 */

namespace app\model;


use ruhua\bases\BaseModel;
use app\model\AuthGroupRule as AuthGroupRuleModel;

class AuthGroup extends BaseModel
{
    public function setRulesAttr($value)
    {
        return json_encode($value);
    }

    public function getRulesAttr($value)
    {
        $rule=json_decode($value);
        $res=AuthGroupRuleModel::where('id','in',$rule)->select();
        $str="";
        foreach ($res as $k=>$v){
            $str.=$v['group'].",";
        }
        $reg['rule_id']=$rule;
        $reg['rule_name']=$str;
        return $reg;
    }


}