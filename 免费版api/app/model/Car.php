<?php
declare (strict_types = 1);

namespace app\model;

use ruhua\bases\BaseModel;
use think\facade\Db;
use app\model\Car as CarModel;


class Car extends BaseModel
{
    public function user()
    {
        return $this->belongsTo('Driver','uid','id');
    }


    public function operators()
    {
        return $this->belongsTo('Admin','operator','id')->field('id,name');
    }

    public function plan()
    {
        return $this->hasMany('Plan','car_id','id')->where('status','<',3)->field('id,order_num,car_id');
    }

   /* public function getPositionAttr($value)
    {
        if($value==null)
            return $value;
        $data=explode(',',$value);
        $arr['lat']=$data[0];
        $arr['lng']=$data[1];
        return $arr;
    }*/

    /**车辆返回中
     * @param $cars
     */
    public static function back($cars)
    {
        Db::startTrans();
        try {
            foreach ($cars as $k=>$v){
                CarModel::update(['state'=>2],['id'=>$v['car_id']]);
            }
            Db::commit();
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }


    public function setCardImgAttr($value)
    {
        return json_encode($value);
    }

   public function getCardImgAttr($value)
    {
        return json_decode($value,true);
    }

    public function setPositionAttr($value)
    {
        return json_encode($value);
    }

    public function getPositionAttr($value)
    {
        if($value==null)
            return $value;
        return json_decode($value);
    }

}
