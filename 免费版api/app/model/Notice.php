<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/17 0017
 * Time: 10:43
 */

namespace app\model;


use ruhua\bases\BaseModel;

class Notice extends BaseModel
{
    public function operators()
    {
        return $this->belongsTo('Admin','operator','id')->field('id,name');
    }

}