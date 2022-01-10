<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/8/31 0031
 * Time: 9:07
 */

namespace app\controller\admin;


use ruhua\bases\BaseController;
use app\model\CarFeeAppli as CarFeeAppliModel;
use ruhua\exceptions\BaseException;
use app\model\OilAppli as OilAppliModel;
use app\model\Oil as OilModel;
use app\model\Plan as PlanModel;

class Trial extends BaseController
{
    /**
     * 车辆费用审核
     */
    public function car_fee($id,$state)
    {
        $list=CarFeeAppliModel::where('id',$id)->find();
        if(!$list){
            throw new BaseException(['msh'=>'信息错误']);
        }
        if($state!=1&&$state!=-1){
            throw new BaseException(['msg'=>'状态数据错误']);
        }
            $res=$list->save(['state'=>$state]);

        return app('json')->go($res);
    }

    public function OilAppli($id)
    {
        $list=OilAppliModel::where('id',$id)->find();
        if(!$list){
            throw new BaseException(['msg'=>'数据错误']);
        }
        $list->save(['state'=>1]);
        $oil=OilModel::where('id','>',0)->find();
        if(!$oil){
            OilModel::create(['use'=>0,'stock'=>0,'price'=>0]);
        }
        $oil=OilModel::where('id','>',0)->find();
        $res=$oil->inc('stock',$list['num'])->update();
        return app('json')->go($res);

    }

    public function plan_trial($order_id)
    {
        $order=PlanModel::where('id',$order_id)->find();
        if(!$order_id){
            throw new BaseException(['msg'=>'订单不存在']);
        }

        if($order['trial']==1){
            throw new BaseException(['msg'=>'已审核过']);
        }

        if($order['is_sign']==0||$order['status']!=2){
            throw new BaseException(['msg'=>'用户暂未签收']);
        }

        $res=$order->save(['trial'=>1]);
        return app('json')->go($res);

    }

}