<?php
declare (strict_types = 1);

namespace app\model;

use ruhua\bases\BaseModel;

/**
 * @mixin think\Model
 */
class OilAppli extends BaseModel
{
    //
    public function operators()
    {
        return $this->belongsTo('Admin','operator','id')->field('id,username,name');
    }
}
