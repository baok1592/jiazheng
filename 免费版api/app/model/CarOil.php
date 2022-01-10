<?php
declare (strict_types = 1);

namespace app\model;

use ruhua\bases\BaseModel;
use ruhua\exceptions\BaseException;


class CarOil extends BaseModel
{

    public function car()
    {
        return $this->belongsTo('Car','car_id','id');
    }

    public function plan()
    {
        return $this->belongsTo('Plan','order_num','order_num');
    }

    public function operators()
    {
        return $this->belongsTo('Admin','operator','id')->field('id,username,name');
    }
}
