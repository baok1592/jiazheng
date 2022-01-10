<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/2 0002
 * Time: 16:15
 */

namespace app\controller\drive;


use app\model\Imgs;
use ruhua\bases\BaseController;
use app\model\Plan as PlanModel;
use ruhua\exceptions\BaseException;
use app\model\SplitOrder as SplitOrderModel;
use app\model\Car as CarModel;

class Order extends BaseController
{
    /**
     * 买家签收
     */
    public function user_sign()
    {
        $data=input('post.');
        $uid=4;
        $order_id=$data['order_id'];
        $imgs=$data['imgs'];

        $list=PlanModel::check_plan($order_id);
        if($list['is_sign']==1){

            throw new BaseException(['msg'=>'订单已签收']);
        }
        if($list['did']!=$uid){
            throw new BaseException(['msg'=>'非司机运单']);
        }
        if($list['status']!=3){
            throw new BaseException(['msg'=>'运输状态错误']);
        }
        $res=PlanModel::update(['is_sign'=>1,'sign_img'=>$imgs,'status'=>4],['id'=>$order_id,'did'=>$uid]);
        $split=SplitOrderModel::where('plan_id',$order_id)->select();
        CarModel::back($split);
        return app('json')->go($res);

    }
}