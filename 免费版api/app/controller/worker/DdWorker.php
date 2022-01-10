<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/8 0008
 * Time: 15:06
 */

namespace app\controller\worker;


use Aliyun\api_demo\SmsDemo;
use app\controller\common\Wl;
use app\controller\drive\CarLine;
use app\service\PlanService;
use ruhua\bases\BaseController;
use app\model\Plan as PlanModel;

class DdWorker extends BaseController
{
    /**
     * 获取待分配调度的订单
     */
    public function get_no_plan()
    {
        $res=PlanModel::where(['status'=>0,'is_sign'=>0,'trial'=>0])->select();

        return app('json')->go($res);
    }

    /**
     * 车辆调度
     */
   /* public function add()
    {
        $data=input('post.');
        $res=(new PlanService())->check_plan($data);
        $cars=$data['cars'];
        if($res){
            PlanModel::update(['status'=>1,'car_id'=>$cars[0]['car_id'],'did'=>$cars[0]['did']],['id'=>$data['id']]);
            $mobile=PlanModel::where('id',$data['id'])->value('mobile');
            Wl::deliver($data);
            //SmsDemo::sendMsgSms($mobile);
        }
        foreach ($cars as $k=>$v){
            $ads[$k]=$v['car_id'];
        }
        CarLine::cancel_dd_line($ads);
        return app('json')->go(['res'=>$res]);
    }*/
}