<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/17 0017
 * Time: 14:00
 */

namespace app\model;


use ruhua\bases\BaseModel;

class Banner extends BaseModel
{
    public function operators()
    {
        return $this->belongsTo('Admin','operator','id')->field('id,name');
    }
}