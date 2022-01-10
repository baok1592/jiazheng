<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/16 0016
 * Time: 10:03
 */

namespace app\model;


use ruhua\bases\BaseModel;

class CarRepair extends BaseModel
{
    public function setJsonAttr($value)
    {
        return json_encode($value);
    }


    public function getJsonAttr($value)
    {
        if($value==null){
            return null;
        }
        return json_decode($value,true);
    }

    public function kduser()
    {
        return $this->belongsTo('Admin','kd_user','id')->field('id,username,name');
    }


}