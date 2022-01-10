<?php
declare (strict_types = 1);

namespace app\model;

use ruhua\bases\BaseModel;


class LineUp extends BaseModel
{
    public function driver()
    {
        return $this->belongsTo('Driver','uid','id');
    }

    public function car()
    {
        return $this->belongsTo('Car','car_id','id');
    }
}
