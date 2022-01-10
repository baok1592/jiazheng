<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/16 0016
 * Time: 14:54
 */

namespace app\model;


use ruhua\bases\BaseModel;

class Equip extends BaseModel
{
    public function car()
    {
        return $this->belongsTo('Car','num','equip_num')->field('id,equip_num,car_num');
    }

    public function operators()
    {
        return $this->belongsTo('Admin','operator','id')->field('id,username,name');
    }
}