<?php
declare (strict_types = 1);

namespace app\model;

use app\service\TokenService;
use ruhua\bases\BaseModel;
use ruhua\exceptions\BaseException;
use ruhua\exceptions\OrderException;
use think\facade\Db;
use think\facade\Log;
use app\model\Car as CarModel;


class Plan extends BaseModel
{
    public function wl()
    {
        return $this->hasMany('Logistics','order_id','id');
    }

    public function recorduser()
    {
        return $this->belongsTo('Admin','record_user','id')->field('id,username,name');
    }

    public function dduser()
    {
        return $this->belongsTo('Admin','dd_user','id')->field('id,username,name');
    }

    public function billuser()
    {
        return $this->belongsTo('Admin','bill_user','id')->field('id,username,name');
    }

    public function driver()
    {
        return $this->belongsTo('Driver','did','id');
    }

    public function  car()
    {
        return $this->belongsTo('Car','car_id','id');
    }

    public function caroil()
    {
        return $this->belongsTo('CarOil','order_num','order_num');
    }

    public function payuser()
    {
        return $this->belongsTo('Admin','pay_user','id')->field('id,username,name');
    }


    /**判断订单是否存在
     * @param $order_id
     */
    public static function check_plan($order_id)
    {
        $list=self::where('id',$order_id)->find();
        if(!$list){
            throw new BaseException(['msg'=>'订单不存在']);
        }
        return $list;
    }

    public function setDdJsonAttr($value)
    {
        return json_encode($value);
    }

    public function getDdJsonAttr($value)
    {
        if($value==null){
            return null;
        }
        return json_decode($value,true);
    }


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

    public function setSignImgAttr($value)
    {
        return json_encode($value);
    }

    public function getSignImgAttr($value)
    {
        if($value!='')
            return json_decode($value);
        else
            return null;
    }

    public function getPayTimeAttr($value)
    {
        if($value==0)
            return '';
        return date("Y-m-d H:m:s",$value);
    }




    /**拆分车辆单
     * @param $data
     * @return bool|\think\Model|static
     * @throws BaseException
     */
    public static function add_car_plan_one($data)
    {
        $data['dd_json']['dd_time']=date('Y-m-d H:m:s');
        $dt=[
            'start'=>$data['start'],
            'end'=>$data['end'],
            'massege'=>$data['massege'],
            'car_num'=>1,
            'record_user'=>$data['record_user'],
            'dd_json'=>$data['dd_json'],
            'status'=>1,
            'car_id'=>$data['dd_json']['car'],
            'weight'=>$data['weight'],
            'dd_user'=>TokenService::getCurrentTokenAid(),
            'tid'=>$data['tid'],
            'trid'=>$data['trid'],
            'main_id'=>$data['main_id']

        ];

        $order_num=self::whereTime('create_time','today')->column('order_num');
        $flg=1;
        while ($flg==1){
            $flg=0;
            $dt['order_num']=Date("Ymd").rand(1000,9999);
            foreach ($order_num as $k=>$v){
                if($v==$dt['order_num']){
                    $flg=1;
                    break;
                }
            }
        }

        Db::startTrans();
        try {
            $car=CarModel::where(['id'=>$data['dd_json']['car'],'state'=>[1,2]])->find();
            if($car){
                throw new OrderException(['msg'=>'有非空闲车辆','data'=>$car]);
            }
            $data['car_id']=$data['dd_json']['car'];
            CarModel::update(['state'=>1],['id'=>$data['dd_json']['car']]);
 
        $res=self::create($dt);


            Db::commit();
            return $res;
        }catch (\Exception $e) {
            Db::rollback();
            Log::error($e->getMessage());
            throw new OrderException(['msg'=>$e->getMessage()]);
            return false;
        }

    }

    public static function add_weight_plan($data)
    {

    }

}
