<?php
declare (strict_types = 1);

namespace app\model;

use ruhua\bases\BaseModel;


class SysConfig extends BaseModel
{
    public static function get($key)
    {
        return self::where('key',$key)->value('value');
    }

    public static function getYzm()
    {
        return self::where('key','is_yzm')->value('value');
    }

    public static function getMapKey()
    {
        return self::where('key','map_web_key')->value('value');
    }
}
