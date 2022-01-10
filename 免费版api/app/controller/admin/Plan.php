<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/18 0018
 * Time: 11:15
 */

namespace app\controller\admin;


use app\controller\common\Common;
use app\controller\common\Wl;
use app\controller\map\Trace;
use app\service\TokenService;
use ruhua\bases\BaseController;
use app\model\Plan as PlanModel;
use ruhua\exceptions\BaseException;
use ruhua\exceptions\OrderException;
use think\facade\Log;
use app\model\Car as CarModel;
use Aliyun\api_demo\SmsDemo;
use app\model\Equip as EquipModel;
use app\model\Admin as AdminModel;

class Plan extends BaseController
{

    /**
     * 申请购置计划
     */
    public function add_plan()
    {
        $uid=TokenService::getCurrentTokenAid();
        $data = input('post.');

        $data['record_user']=$uid;
        $rule = [
            'start' => 'require',
            'end' => 'require',

        ];
        if(!isset($data['weight'])){
            $data['weight']=0;
        }
        $this->validate($data, $rule);
        $type=$data['type'];//1计划车数2计划吨数
        if($type==1){

            $dt=[
                'start'=>$data['start'],
                'end'=>$data['end'],
                'car_num'=>$data['num'],
                'massege'=>$data['massege'],
                'record_user'=>$uid,
                'type'=>1,
                'weight'=>$data['weight']
            ];
            $res=PlanModel::create($dt);
        }else{
            $dt=[
                'start'=>$data['start'],
                'end'=>$data['end'],
                'weight'=>$data['num'],
                'massege'=>$data['massege'],
                'record_user'=>$uid,
                'type'=>2
            ];
            $res=PlanModel::create($dt);
        }
        return app('json')->go($res);
    }

    /**删除购置计划
     * @param $id
     * @return mixed
     */
    public function del($id)
    {



        $group=AdminModel::where('id',1)->value('group_id');
        $groups=TokenService::getCurrentTokenGroup();
        if($group!=$groups)
            throw new BaseException(['msg'=>'无权限删除']);
        $plan=PlanModel::where('id',$id)->find();

        if($plan['main_id']>0){
            $main=PlanModel::find($plan['main_id']);
            if($plan['dd_json']['plan_type']==1){
                $main['car_num']=$main['car_num']+$plan['car_num'];
            }
            else
                $main['weight']= $main['weight']+$plan['weight'];
            $main->save();
        }


        $car=$plan['car_id'];
        $plans=PlanModel::where(['car_id'=>$car,'status'=>[0,1,2]])->where('id','<>',$id)->find();
        if(!$plans){
            CarModel::update(['state'=>0],['id'=>$car]);
        }

        if($plan['tid']>0&&$plan['trid']>0){
            $map=new Trace();
            $map->del_trace($plan['tid'],$plan['trid']);
        }
        $res=PlanModel::destroy($id);
        return app('json')->go($res);
    }


    /**
     * 调度车辆拆分为单车
     */
    public function dd_car_one()
    {

        $data=input('post.');
        $uid=TokenService::getCurrentTokenAid();
        $data['dd_user']=$uid;
        $tid=0;
        $trid=0;
        $type=$data['dd_json']['type'];
        $plan_type=$data['dd_json']['plan_type'];
            $plan=PlanModel::find($data['id']);
            if($plan['dd_json']){
                throw new OrderException(['msg'=>'该计划已调度']);
            }

            $record_user=$plan['record_user'];


            $map=new Trace();
            $car_id=$data['dd_json']['car'];
            $equip=CarModel::where('id',$car_id)->value('equip_num');
            if($equip)
                $tid=EquipModel::where('num',$equip)->value('tid');
            else
                $tid=0;
            if($tid!=0){
                $map_res=$map->add_trace($tid);
                $trid=$map_res['data']['trid'];
            }else
            {
                $trid=0;
            }




        if($type==0){
            $rule=[
                'id'=>'require',
                'dd_json'=>'require'
            ];
            
            $data['dd_json']['dd_time']=date('Y-m-d H:m:s');
            $this->validate($data,$rule);
            $data['status']=1;
            $order_num=PlanModel::whereTime('create_time','today')->column('order_num');
            $flg=1;
            while ($flg==1){
                $flg=0;
                $data['order_num']=Date("Ymd").rand(1000,9999);
                foreach ($order_num as $k=>$v){
                    if($v==$data['order_num']){
                        $flg=1;
                        break;
                    }
                }
            }

            $car=CarModel::where(['id'=>$data['dd_json']['car'],'state'=>[1,2]])->find();
            if($car){
                throw new OrderException(['msg'=>'有非空闲车辆','data'=>$car]);
            }
            $data['car_id']=$data['dd_json']['car'];
          
            $data['tid']=$tid;
            $data['trid']=$trid;

            CarModel::update(['state'=>1],['id'=>$data['dd_json']['car']]);
            $plan=PlanModel::find($data['id']);
            if($plan['car_num']>1)
                throw new BaseException(['msg'=>'状态错误']);
            SmsDemo::sendMsgToDrive($data['dd_json']['car_info']['mobile'],$plan['start'],$plan['end']);
            $res=PlanModel::update($data,['id'=>$data['id']]);
        }
        elseif ($type==1){
            if($plan_type==1){
                if($plan['car_num']==""||$plan['car_num']==0||$plan['car_num']==1)
                    throw new OrderException(['msg'=>'无法拆分']);
                
                $way=[
                    'start'=>$plan['start'],
                    'end'=>$plan['end'],
                    'massege'=>$plan['massege'],
                    'num'=>$plan['car_num'],
                    'id'=>$data['id'],
                    'dd_json'=>$data['dd_json'],
                    'record_user'=>$record_user,
                    'weight'=>$data['dd_json']['yz_num'],
                    'tid'=>$tid,
                    'trid'=>$trid,
                    'main_id'=>$plan['id']
                ];
             
             
                SmsDemo::sendMsgToDrive($data['dd_json']['car_info']['mobile'],$plan['start'],$plan['end']);
                $res=PlanModel::add_car_plan_one($way);
                 
                $plan->save(['car_num'=>($plan['car_num']-1)]);
            }else{
                if($data['dd_json']['num']==""||$data['dd_json']['num']==0)
                    throw new OrderException(['msg'=>'数量不能为0']);
                $weight=$data['dd_json']['num'];
                if($plan['weight']<=$weight)
                    throw new BaseException(['msg'=>'数量已大于计划数量']);
                else{
                    $data['dd_json']['dd_time']=date('Y-m-d H:m:s');
                    $dt=[
                        'start'=>$plan['start'],
                        'end'=>$plan['end'],
                        'massege'=>$plan['massege'],
                        'type'=>2,
                        'weight'=>$weight,
                        'dd_json'=>$data['dd_json'],
                        'status'=>1,
                        'car_id'=>$data['dd_json']['car'],
                        'record_user'=>$record_user,
                        'dd_user'=>TokenService::getCurrentTokenAid(),
                        'tid'=>$tid,
                        'trid'=>$trid,
                        'main_id'=>$plan['id']
                    ];
                    SmsDemo::sendMsgToDrive($data['dd_json']['car_info']['mobile'],$plan['start'],$plan['end']);
                    $order_num=PlanModel::whereTime('create_time','today')->column('order_num');
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

                    $res=PlanModel::create($dt);
                    $car=CarModel::where(['id'=>$data['dd_json']['car'],'state'=>[1,2]])->find();
                    if($car){
                        throw new OrderException(['msg'=>'有非空闲车辆','data'=>$car]);
                    }
                    CarModel::update(['state'=>1],['id'=>$data['dd_json']['car']]);
                    $plan->save(['weight'=>($plan['weight']-$weight)]);
                }
            }

        }else{

            if(isset($data['dd_json']['plan_ids']))
                $plan_ids=$data['dd_json']['plan_ids'];
            else
                $plan_ids=$data['id'];
            $plan=PlanModel::where(['id'=>$plan_ids,'status'=>0])->find();
            if(!$plan)
                throw new OrderException(['msg'=>'该订单已被调度']);

            $car=CarModel::find($data['dd_json']['car']);
            $car->save(['state'=>1]);

            $data['dd_json']['dd_time']=date('Y-m-d H:m:s');
            $flg=1;
            $order_num=PlanModel::whereTime('create_time','today')->column('order_num');
            while ($flg==1){
                $flg=0;
                $data['order_num']=Date("Ymd").rand(1000,9999);
                foreach ($order_num as $k=>$v){
                    if($v==$data['order_num']){
                        $flg=1;
                        break;
                    }
                }
            }
           $res=PlanModel::where(['id'=>$plan_ids])->update(['dd_json'=>json_encode($data['dd_json']),'tid'=>$tid,'trid'=>$trid,'order_num'=>$data['order_num'],'car_id'=>$data['dd_json']['car'],'status'=>1,'dd_user'=>TokenService::getCurrentTokenAid()]);
        }


        return app('json')->go($res);

    }


    /**添加单据
     * @return mixed
     * @throws BaseExceptio
     */
    public function add_bill()
    {
        $data=input('post.');
        $rule=[
            'id'=>'require',
            'json'=>'require'
        ];


        $this->validate($data,$rule);


        $goods=$data['json']['goods'];
        if(count($goods)==0)
            throw new OrderException(['msg'=>'货物信息未填写完整']);
        foreach ($goods as $k=>$v){
            if($v['name']==''||$v['num']==''||$v['weight']==''||$v['unit_price']=='')
                throw new OrderException(['msg'=>'货物信息未填写完整']);
        }

        $dt['id']=$data['id'];

        $dt['json']=$data['json'];
        $dt['json']['create_time']=date("Y-m-d H:i:s");

        $dt['bill_user']=TokenService::getCurrentTokenAid();

        $plan=PlanModel::find($data['id']);
        if($plan['dd_json']=="")
        {
            throw new BaseException(['msg'=>'计划未调度车辆，无法开单']);
        }

        if($plan['json']){
            throw new BaseException(['msg'=>'单据已开，无需再改']);
        }

        $dt['status']=2;
        $dt['total_price']=$data['total_price'];
       // SmsDemo::sendMsgToReciver($dt['json']['received_tel'],$plan['order_num'],$plan['dd_json']['car_info']['car_num'],$plan['dd_json']['car_info']['drive_name'],$plan['dd_json']['car_info']['mobile']);

        $res=PlanModel::update($dt,['id'=>$dt['id']]);
        $plan=PlanModel::find($data['id']);

        $yk_money=$plan['dd_json']['yk_money'];
        $jy_money=$plan['dd_json']['jy_money'];
        $car_id=$plan['dd_json']['car'];
        $car=CarModel::find($car_id);
        if($jy_money!=0){
            $car->save(['jyje'=>($car['jyje']+(float)$jy_money),'yk_money'=>0]);
        }
        else{
            $car->save(['yk_money'=>$yk_money]);
        }


        return app('json')->go($res);
    }

    public function get_plan($id="",$start="",$end="")
    {
        if($id=="")
            $plan=PlanModel::with(['recorduser','dduser','billuser'])->order('create_time desc')->select();
        else
            $plan=PlanModel::with(['recorduser','dduser','billuser'])->where('id',$id)->find();
        if($start!=""&&$end!=""){
            $end.=" 23:59:59";
            $plan=PlanModel::with(['recorduser','dduser','billuser'])->whereTime('create_time','between',[$start,$end])->select();
        }
        return app('json')->go($plan);
    }

    public function get_plan_finish($id="",$start="",$end="")
    {
        if($id=="")
            $plan=PlanModel::with(['recorduser','dduser','billuser','payuser'])->where('status',3)->order('create_time desc')->select();
        else
            $plan=PlanModel::with(['recorduser','dduser','billuser','payuser'])->where('id',$id)->where('status',3)->find();
        if($start!=""&&$end!=""){
            $end.=" 23:59:59";
            $plan=PlanModel::with(['recorduser','dduser','billuser','payuser'])->whereTime('create_time','between',[$start,$end])->where('status',3)->select();
        }
        return app('json')->go($plan);
    }

    public function update_plan()
    {
        $data = input('post.');
        $type = $data['type'];//1车数2吨数
        if ($type == 1) {
            $dt = [
                'start' => $data['start'],
                'end' => $data['end'],
                'massege' => $data['massege'],
                'car_num' => $data['num'],
                'weight' => 0,
                'type'=>1
            ];
        } else {
            $dt = [
                'start' => $data['start'],
                'end' => $data['end'],
                'massege' => $data['massege'],
                'car_num' => 0,
                'weight' => $data['num'],
                'type'=>2
            ];

        }
        $res = PlanModel::update($dt,['id'=>$data['id']]);

        return app('json')->go($res);
    }

    /**修改待装运车辆信息
     * @param $id
     * @param $cid
     */
    public function update_wait_car()
    {
        $data=input('post.');

        $car=CarModel::find($data['car']);
        $plan=PlanModel::find($data['id']);

        if($car['state']!=0&&$plan['car_id']!=$data['car'])
            throw new OrderException(['msg'=>'选择车辆已在运输中']);
        if($plan['status']!=1)
            throw new OrderException(['msg'=>'状态错误']);

        $old_car_id=$plan['car_id'];
        $dd_json=$plan['dd_json'];
        $dd_json['car']=$data['car'];
        $dd_json['jy_money']=$data['jy_money'];
        $dd_json['msg_money']=$data['msg_money'];
        $dd_json['yk_money']=$data['yk_money'];
        $dd_json['yz_num']=$data['yz_num'];

        $dd_json['car_info']=$car;
        $dd_json['dd_time']=date("Y-m-d H:m:s");
        $plan['dd_json']=$dd_json;
        $plan['dd_user']=TokenService::getCurrentTokenAid();

        SmsDemo::sendMsgToDrive($plan['dd_json']['car_info']['mobile'],$plan['start'],$plan['end']);

        $res=PlanModel::update(['car_id'=>$data['car'],'dd_json'=>$dd_json,'dd_user'=>$plan['dd_user']],['id'=>$data['id']]);

        CarModel::update(['state'=>1],['id'=>$data['car']]);

        if($old_car_id!=$data['car']){
            $old_plan=PlanModel::where(['car_id'=>$old_car_id,'status'=>[0,1,2]])->find();

            if(!$old_plan){
               $res= CarModel::update(['state'=>0],['id'=>$old_car_id]);

            }

        }
        return app('json')->go($res);
    }

    public function pay_plan($id,$state)
    {
        $plan=PlanModel::where(['id'=>$id,'status'=>3,'is_pay'=>0])->find();
        if(!$plan){
            throw new OrderException(['msg'=>'状态错误']);
        }
        if($state==0)
            $state=1;
        $res=$plan->save(['is_pay'=>$state,'pay_time'=>time(),'pay_user'=>TokenService::getCurrentTokenAid()]);
        return app('json')->go($res);
    }

    public function update_plan_car($id,$car_id)
    {
        $car=CarModel::find($car_id);
        $plan=PlanModel::find($id);
        if($car['state']!=0)
            throw new OrderException(['msg'=>'选择车辆已在运输中']);
        if($plan['status']!=2)
            throw new OrderException(['msg'=>'状态错误']);

        $old_car_id=$plan['car_id'];
        $plan['car_id']=$car_id;
        $dd_json=$plan['dd_json'];
        $dd_json['car']=$car_id;

        $dd_json['car_info']=$car;
        $dd_json['dd_time']=date("Y-m-d H:m:s");
        $plan['dd_json']=$dd_json;
        $plan['dd_user']=TokenService::getCurrentTokenAid();

        SmsDemo::sendMsgToDrive($plan['dd_json']['car_info']['mobile'],$plan['start'],$plan['end']);
        $res=PlanModel::update(['car_id'=>$plan['car_id'],'dd_json'=>$dd_json,'dd_user'=>$plan['dd_user']],['id'=>$id]);

        CarModel::update(['state'=>1],['id'=>$car_id]);

        $old_plan=PlanModel::where(['car_id'=>$old_car_id,'status'=>[0,1,2]])->find();
        if(!$old_plan)
            CarModel::update(['state'=>0],['id'=>$old_car_id]);
        return app('json')->go($res);


    }

}