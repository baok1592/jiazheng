<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/8/31 0031
 * Time: 15:42
 */

namespace app\controller\drive;


use app\model\LineUp;
use ruhua\bases\BaseController;
use app\model\LineUp as LineUpModel;
use ruhua\exceptions\BaseException;
use app\model\Car as CarModel;
use think\facade\Log;
use app\model\Plan as PlanModel;

class CarLine extends BaseController
{
    /**加入队列
     * @return mixed
     * @throws BaseException
     */
    public static function add($car_id)
    {
        $uid=4;
        Log::error("car_id*****************8");
        Log::error($car_id);
        Log::error("car_id*****************8");
/*        $is_plan=PlanModel::where(['car_id'=>$car_id,'is_sign'=>0])->find();
        if($is_plan){
            throw new BaseException(['msg'=>'该车运输任务还没结束']);
        }*/
        $carlist=CarModel::where('id',$car_id)->find();
        if(!$carlist){
            throw new BaseException(['msg'=>'司机没有车辆']);
        }



        $data['uid']=$uid;
        $data['car_id']=$car_id;
        $list=LineUpModel::where('car_id',$car_id)->find();
        if($list){
            throw new BaseException(['msg'=>'车辆已在队列中']);
        }
        $res=LineUpModel::create($data);
        return $res;

    }

    /**
     * 司机取消排队
     */
    public function cancel_line()
    {
        $uid=4;
        $res=LineUpModel::where('uid',$uid)->delete();
        return app('json')->go($res);

    }

    /**
     * 调度车辆离开排队
     */
    public static function cancel_dd_line($ids)
    {
        $res=LineUpModel::where('car_id','in',$ids)->delete();
        return app('json')->go($res);

    }

    /**订单派送正在排队的司机
     * @param $order_id
     */
    public static function send_order($data)
    {
        //$order_id
        $line=LineUpModel::limit(1)->select();
        if(count($line)){
            $car_id=$line[0]['car_id'];
            $plan=PlanModel::where(['id'=>$order_id,'car_id'=>0])->find();
            if(!$plan){
                throw new BaseException(['订单已有司机接收']);
            }
            $plan->save(['car_id'=>$car_id,'did'=>$line[0]['uid']]);
            $res=LineUpModel::destroy($line[0]['id']);

        }

    }



}