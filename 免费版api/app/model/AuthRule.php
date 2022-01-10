<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/5 0005
 * Time: 14:19
 */

namespace app\model;


use ruhua\bases\BaseModel;

class AuthRule extends BaseModel
{
    public function rule()
    {
        return $this->belongsTo('AuthRule','id','pid');
    }
}