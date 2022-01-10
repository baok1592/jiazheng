<?php
declare (strict_types = 1);

namespace app\model;

use ruhua\bases\BaseModel;

class Parts extends BaseModel
{
    public function partsrecord()
    {
        return $this->hasMany('PartsAppli','id','parts');
    }
}
