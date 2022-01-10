<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/8 0008
 * Time: 16:08
 */

namespace app\service;
use app\controller\common\Wl;
use app\model\Plan as PlanModel;
use app\model\SplitOrder;
use ruhua\exceptions\BaseException;
use think\facade\Db;
use app\model\SplitOrder as SplitOrderModel;
use app\model\Car as CarModel;
use think\facade\Log;

class PlanService
{
    public function check_plan($data)
    {
        Log::error($data);
        $uid=1;
        $plan=PlanModel::where('id',$data['id'])->find();
        if(!$plan){
            throw new BaseException(['msg'=>'订单不存在']);
        }
        if($plan['status']!=0){
            throw new BaseException(['msg'=>'状态有误']);
        }
        if($plan['weight']!=$data['weight']){
            throw new BaseException(['msg'=>'货物重量错误']);
        }
        $cars=$data['cars'];

        Db::startTrans();
        try {
            foreach ($cars as $k=>$v){
                SplitOrderModel::create(['plan_id'=>$data['id'],'weight'=>$v['weight'],'car_id'=>$v['car_id'],'manager'=>$uid]);
              //  Wl::deliver($data['id'],$v['did'],$v['car_id']);
            }
            Db::commit();
        } catch (\Exception $e) {
            Db::rollback();
           // throw new BaseException(['msg'=>$e->getMessage()]);
            return false;
        }
        return true;
    }



}