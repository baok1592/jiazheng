<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/16 0016
 * Time: 11:37
 */

namespace app\model;


use ruhua\bases\BaseModel;

class PartsRecord extends BaseModel
{

    public function operators()
    {
        return $this->belongsTo('Admin','operator','id')->field('id,username,name');
    }
}