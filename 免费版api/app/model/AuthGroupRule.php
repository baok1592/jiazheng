<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/5 0005
 * Time: 14:44
 */

namespace app\model;


use ruhua\bases\BaseModel;

class AuthGroupRule extends BaseModel
{
    public function rule()
    {
        return $this->belongsTo('AuthRule','group','id')->field('id,name');
    }

    public function setRuleAttr($value)
    {
        return json_encode($value);
    }

    public function getRuleAttr($value)
    {
        return json_decode($value);
    }
}