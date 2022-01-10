<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/5 0005
 * Time: 11:32
 */

namespace app\controller\drive;


use ruhua\bases\BaseController;
use app\model\ParkFee as ParkFeeModel;
use  app\model\Car as CarModel;
use ruhua\exceptions\BaseException;
use think\facade\Log;
use app\model\Park as ParkModel;

class Park extends BaseController
{
    /**
     * 司机扫码出入停车场
     */
    public function qrcode()
    {
        $data=input('post.');
        $uid=4;
       // $code=$data['code'];
      /*  $code=json_decode($code,true);
        if($code['type']!="park"){
            throw new BaseException(['msg'=>'参数错误']);
        }
        $park=explode(":",$code['code']);*/

        $park_id=$data['park_id'];
        $type=$data['type'];
        $code=$data['code'];
        if($type!="park"){
            throw new BaseException(['msg'=>'参数错误']);
        }
        $parklist=ParkModel::where('id',$park_id)->find();
        if($parklist['code']!=$code){
            throw new BaseException(['msg'=>'验证码已过期']);
        }
        $car_num=CarModel::where(['uid'=>$uid,'is_bind'=>1])->value('car_num');
        $car_id=CarModel::where(['uid'=>$uid,'is_bind'=>1])->value('id');
        $list=ParkFeeModel::where(['car_num'=>$car_num,'uid'=>$uid,'state'=>0,'park'=>$park_id])->find();
        if(!$list){
            CarLine::add($car_id);
            $res=ParkFeeModel::create(['car_num'=>$car_num,'uid'=>$uid,'park'=>$park_id,'start_time'=>time(),'price'=>$parklist['fee']]);

        }else{
            $time=time();
            if(!$parklist){
                throw new BaseException(['msg'=>'参数有误']);
            }
            $price=(float)($time-$list['start_time'])/3600.0*$parklist['fee'];
            $price=round($price,2);
            $res=$list->save(['end_time'=>$time,'total'=>$price,'state'=>1]);
        }
        return app('json')->go($res);
    }
}