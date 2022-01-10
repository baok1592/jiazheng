<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/17 0017
 * Time: 15:01
 */

namespace app\controller\common;


use ruhua\bases\BaseController;
use app\model\Plan as PlanModel;
use ruhua\exceptions\BaseException;
use app\model\Car as  CarModel;

class Plan extends BaseController
{
    /**
     * 买家签收
     */
    public function user_sign()
    {
        $data=input('post.');
        $order_num=$data['order_num'];
        $imgs[0]=$data['imgs'];
        $sign_car=$data['sign_car'];
        $car_id=CarModel::where('car_num',$sign_car)->value('id');

        $list=PlanModel::where('order_num',$order_num)->find();
        if(!$list)
            throw new BaseException(['msg'=>'订单不存在']);
        if($list['is_sign']==1){
            throw new BaseException(['msg'=>'订单已签收']);
        }

        if($list['car_id']!=$car_id)
            throw new BaseException(['msg'=>'车牌不符']);
        if($list['status']!=2){
            throw new BaseException(['msg'=>'状态错误']);
        }


        $car=$list['dd_json']['car'];

        $res=PlanModel::update(['is_sign'=>1,'sign_img'=>$imgs,'status'=>3,'sign_car'=>$sign_car],['id'=>$list['id']]);
        $plan=PlanModel::where(['car_id'=>$car_id,'status'=>[0,1]])->select();
        if(count($plan)==0)
            CarModel::update(['state'=>0],['id'=>$car]);
       // $split=SplitOrderModel::where('plan_id',$order_id)->select();
     //   CarModel::back($split);
        return app('json')->go($res);

    }

}