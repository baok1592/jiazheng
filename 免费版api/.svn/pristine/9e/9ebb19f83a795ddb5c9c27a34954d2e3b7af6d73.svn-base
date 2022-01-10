<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/1 0001
 * Time: 15:01
 */

namespace app\controller\common;
/**
 * 物流管理模块
 */

use ruhua\bases\BaseController;
use app\model\Plan as PlanModel;
use ruhua\exceptions\BaseException;
use app\model\Logistics as LogisticsModel;
use think\facade\Db;
use app\model\Driver as DriverModel;

class Wl extends BaseController
{

    /**
     * 下单模块
     */
    public static function add_order_temp($order_id)
    {
        $plan=PlanModel::where('id',$order_id)->find();
        if(!$plan){
            throw new BaseException(['msg'=>'订单错误']);
        }
        $type="下单";
        $content="商品已经下单";
        $data=[
            'order_id'=>$order_id,
            'type'=>$type,
            'content'=>$content
        ];
        $list=LogisticsModel::where(['order_id'=>$order_id,'type'=>$type])->find();
        if($list){
            throw new BaseException(['msg'=>'下单已填写']);
        }
        $res=LogisticsModel::create($data);
        //return app('json')->go($res);
    }


    /**装车模块
     * @param $order_id
     */
    public static function deliver($data)
    {
        //$order_id,$driver_id,$car_id
        $order_id=$data['id'];
        $plan=PlanModel::where('id',$order_id)->find();
        if(!$plan){
            throw new BaseException(['msg'=>'订单错误']);
        }
        $cars=$data['cars'];

        $type="装车中";
        $content="订单正在装车";
        Db::startTrans();
        try {
            foreach ($cars as $k=>$v){
                $data=[
                    'order_id'=>$order_id,
                    'type'=>$type,
                    'content'=>$content,
                    'driver_id'=>$v['did'],
                    'car_id'=>$v['car_id']
                ];
                $list=LogisticsModel::where(['order_id'=>$order_id,'type'=>$type])->find();
                if($list){
                    continue;
                }
                LogisticsModel::create($data);
            }
            Db::commit();
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
        return true;
    }


    /**运输模块
     * @param $order_id
     * @param $arrive
     * @param string $target
     * @return mixed
     * @throws BaseException
     */
    public static function trans($order_id,$arrive,$target='')
    {


        $type="运输中";
        $plan=PlanModel::where(['id'=>$order_id])->find();
        if(!$plan){
            throw new BaseException(['msg'=>'订单错误']);
        }
        if($plan['status']==1){
            PlanModel::update(['status'=>2],['id'=>$plan['id']]);
            $content="订单从$arrive 出发，准备发往$target";
        }
        elseif($plan['status']==2){
            $content="订单已到$arrive";
        }else{
            throw new BaseException(['msg'=>'快递状态错误']);
        }
      /*  if($target!=''){
            $plan->save(['status'=>2]);
            $content="订单从$arrive 出发，准备发往$target";
        }else{
            $content="订单已到$arrive";
        }*/
        $data=[
            'order_id'=>$order_id,
            'type'=>$type,
            'content'=>$content,
            'driver_id'=>$plan['did'],
            'car_id'=>$plan['car_id']
        ];
        $res=LogisticsModel::create($data);
        return $res;
    }

    /**司机到达目的地
     * @param $order_id
     * @return \think\Model|static
     * @throws BaseException
     */
    public static function paisong($order_id)
    {
        $plan=PlanModel::where('id',$order_id)->find();
        if($plan['status']!=2){
            throw new BaseException(['msg'=>'快递状态错误']);
        }
        $wl=LogisticsModel::where(['order_id'=>$order_id,'type'=>'待确认'])->find();
        if($wl){
            throw new BaseException(['msg'=>'资料已填写']);
        }


        $driver=DriverModel::where('id',$plan['did'])->find();
        $type="待确认";
        $content="订单已到达目的地\n联系人:{$driver['name']}\n联系电话:{$driver['mobile']}\n";
        $data=[
            'order_id'=>$order_id,
            'type'=>$type,
            'content'=>$content,
            'driver_id'=>$plan['did'],
            'car_id'=>$plan['car_id']
        ];
        $res=LogisticsModel::create($data);
        $plan->save(['status'=>3]);
        return $res;
    }

    /**订单交易完成
     * @param $order_id
     */
    public static function finish($order_id)
    {
        $plan=PlanModel::where('id',$order_id)->find();
        if($plan['status']!=3){
            throw new BaseException(['msg'=>'快递状态错误']);
        }
        $type="交易完成";
        $content="已收货";
        $data=[
            'order_id'=>$order_id,
            'type'=>$type,
            'content'=>$content,
            'driver_id'=>$plan['did'],
            'car_id'=>$plan['car_id']
        ];
        $res=LogisticsModel::create($data);
        $plan->save(['status'=>4]);
        return $res;
    }






}