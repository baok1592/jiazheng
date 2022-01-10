<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/27 0027
 * Time: 16:32
 */

namespace app\model;



use ruhua\bases\BaseModel;

class OilSale extends BaseModel
{

    public function operators()
    {
        return $this->belongsTo('Admin','operator','id')->field('id,username,name');
    }
}