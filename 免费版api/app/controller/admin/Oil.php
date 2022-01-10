<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/8/31 0031
 * Time: 15:00
 */

namespace app\controller\admin;


use app\service\TokenService;
use ruhua\bases\BaseController;
use app\model\Oil as OilModel;
use app\model\OilAppli as OilAppliModel;
use app\model\Car as CarModel;
use ruhua\exceptions\BaseException;
use app\model\CarOil as CarOilModel;
use app\model\CarFee as CarFeeModel;
use app\model\Plan as PlanModel;
use think\facade\Db;
use app\model\OilSale as OilSaleModel;
use think\facade\Log;

class Oil extends BaseController
{



    /**查看油库信息
     * @return mixed
     */
    public function get_oil()
    {
        $list=OilModel::with('operators')->order('id desc')->select();
        return app('json')->go($list);
    }

    /**
     * 油库申购
     */
    public function add_oil_appli()
    {
        $data=input('post.');
        $rule=[
            'car_num'=>'require',
            'car_name'=>'require',
            'mobile'=>'require',
            'num'=>'require',
            'density'=>'require',
            'massege'=>'require'
        ];
        $this->validate($data,$rule);
        $data['operator']=TokenService::getCurrentTokenAid();
        $res=OilAppliModel::create($data);
        $oid=OilModel::order('id desc')->find();
        $oil=OilModel::find($oid['id']);
        if(!$oid){
            $new_data=[
                'stock'=>$data['num'],
                'operator'=>TokenService::getCurrentTokenAid(),
                'car_name'=>$data['car_name'],
                'content'=>$data['massege'],
                'mobile'=>$data['mobile'],
                'trans_car'=>$data['car_num'],
                'num'=>$data['num']
            ];
        }else{
            $new_data=[
                'stock'=>($oil['stock']+$data['num']),
                'operator'=>TokenService::getCurrentTokenAid(),
                'car_name'=>$data['car_name'],
                'content'=>$data['massege'],
                'mobile'=>$data['mobile'],
                'trans_car'=>$data['car_num'],
                'num'=>$data['num']
            ];
        }
        OilModel::create($new_data);
        return app('json')->go($res);
    }

    /**
     * 油库申购
     */
    public function update_oil_appli()
    {
        $data=input('post.');
        $rule=[
            'car_num'=>'require',
            'car_name'=>'require',
            'mobile'=>'require',
            'num'=>'require',
            'density'=>'require',
            'massege'=>'require'
        ];
        $this->validate($data,$rule);
        $data['operator']=TokenService::getCurrentTokenAid();
        $res=OilAppliModel::update($data,['id'=>$data['id']]);

        return app('json')->go($res);
    }


    public function get_oil_appli($start="",$end="")
    {
        $res=OilAppliModel::with('operators')->order('create_time desc')->select();
        if($start!=""&&$end!=""){
            $end.=" 23:59:59";
            $res=OilAppliModel::with('operators')->whereTime("create_time",'between',[$start,$end])->order('create_time desc')->select();
        }
        return app('json')->go($res);
    }



    /**
     * 加油信息填写
     */
    public function add_car_oil()
    {
        $data=input('post.');
        $rule=[
            'car_id'=>'require',
            'price'=>'require',
            'total'=>'require',
            'massege'=>'require'
        ];
        $oil=OilModel::order('id desc')->find();
        $uid=TokenService::getCurrentTokenAid();
        $data['operator']=$uid;
        $this->validate($data,$rule);
        $stock=$oil['stock']-$data['num'];
        if($stock<0){
            throw new BaseException(['msg'=>'油量不够']);
        }
        $car=CarModel::find($data['car_id']);
        if($data['jy_money']!=0){

            $jyje=$car['jyje'];
            $money=(float)$jyje-(float)$data['total'];
            if($money<0)
                throw new BaseException(['msg'=>'余额不足']);
            CarModel::update(['jyje'=>$money],['id'=>$car['id']]);
            $car->save(['jyje'=>$money]);
            $data['syyk']=0;
            $data['syye']=$money;
        }else{
            $data['syyk']=$data['yk_money'];
            $data['syye']=$car['jyje'];
        }
        $data['syyl']=$stock;





        $res=CarOilModel::create($data);
        OilModel::update(['stock'=>$oil['stock']-$data['num']],['id'=>$oil['id']]);
        return app('json')->go($res);
    }

    /**
     * 加油信息填写
     */
    public function update_car_oil()
    {
        $data=input('post.');

        $uid=TokenService::getCurrentTokenAid();
        $data['operator']=$uid;
        if($data['jy_money']!=0){
            $syyl=(float)$data['jy_money']-(float)$data['total'];
            $car=CarModel::where('car_num',$data['car_num'])->find();
            CarModel::update(['jyje'=>($syyl+$car['jyje'])],['id'=>$car['id']]);
            $syyk=0;
        }else{
            $syyk=(float)$data['yk_money']-(float)$data['total'];
            $syyl=0;
        }


        if($syyk<0){
            $syyk=0;
            $data['syyk']=$syyk;
        }
        if($syyl<0){
            $data['syyl']=0;
        }


        $res=CarOilModel::update($data,['id'=>$data['id']]);

        return app('json')->go($res);
    }


    /**删除加油信息
     * @param $id
     * @return mixed
     */
    public function del_car_oil($id)
    {
        $res=CarOilModel::destroy($id);
        return app('json')->go($res);
    }

    /**
     * 添加销售
     */
    public function add_sale()
    {
        $data=input('post.');
        $rule=[
            'username'=>'require',
            'num'=>'require',
            'price'=>'require',
            'total'=>'require',
            'massege'=>'require',
        ];
        $data['operator']=TokenService::getCurrentTokenAid();
        $this->validate($data,$rule);
        $res=OilSaleModel::create($data);
        return app('json')->go($res);

    }
    /**获取加油信息
     * @return mixed
     */

    public function get_car_oil($start="",$end="")
    {
        $res=CarOilModel::with(['car','operators'])->order('create_time desc')->select();
        if($start!=""&&$end!=""){
            $end.=" 23:59:59";
            $res=CarOilModel::with(['car','operators'])->whereTime('create_time','between',[$start,$end])->order('id desc')->select();


        }

        return app('json')->go($res);
    }

    /**
     * 获取所有销售情况
     */
    public function get_sale($start="",$end="")
    {
        $res=OilSaleModel::with('operators')->order('create_time desc')->select();
        if($start!=""&&$end!=""){
            $end.=" 23:59:59";
            $res=OilSaleModel::with('operators')->whereTime('create_time','between',[$start,$end])->order('create_time desc')->select();


        }
        return app('json')->go($res);

    }

    /**
     * 更新销量信息
     */
    public function update_sale()
    {
        $data=input('post.');
        $res=OilSaleModel::update($data,['id'=>$data['id']]);
        return app('json')->go($res);

    }

    public function del_sale($id)
    {
        $res=OilSaleModel::destroy($id);
        return app('json')->go($res);
    }

    public function del_oil_appli($id)
    {
        $res=OilAppliModel::destroy($id);
        return app('json')->go($res);
    }

    public function get_oil_data($start="",$end="")
    {
        $oil_app=OilAppliModel::order('id desc')->select();
        $sale=OilSaleModel::order('id desc')->select();
        $car_oil=CarOilModel::order('id desc')->select();
        if($start!=""&&$end!=""){
            $end.="23:59:59";
            $oil_app=OilAppliModel::order('id desc')->whereTime("create_time",'between',[$start,$end])->select();
            $sale=OilSaleModel::order('id desc')->whereTime("create_time",'between',[$start,$end])->select();
            $car_oil=CarOilModel::order('id desc')->whereTime("create_time",'between',[$start,$end])->select();
        }
        $arr=array();
        $j=0;
       foreach ($oil_app as $k=>$v){
            $v['type']="oil";
            $arr[$j++]=$v;
        }

        foreach ($sale as $k=>$v){
            $v['type']="sale";
            $arr[$j++]=$v;
        }


        foreach ($car_oil as $k=>$v){
            $v['type']="car_oil";
            $arr[$j++]=$v;
        }



            foreach ($arr as $k=>$v){
                foreach ($arr as $key=>$val){
                    $time1=strtotime($v['update_time']);
                    $time2=strtotime($val['update_time']);
                    if($time1>=$time2){
                        $arr[$k]=$val;
                        $arr[$key]=$v;
                        break;
                    }

                }
            }

        foreach ($arr as $k=>$v){
            foreach ($arr as $key=>$val){
                $time1=strtotime($v['update_time']);
                $time2=strtotime($val['update_time']);
                if($time1>=$time2){
                    $arr[$k]=$val;
                    $arr[$key]=$v;
                    break;
                }

            }
        }
        return app('json')->go($arr);

    }


    public static function get_oil_data_api($start="",$end="")
    {
        $oil_app=OilAppliModel::order('id desc')->select();
        $sale=OilSaleModel::order('id desc')->select();
        $car_oil=CarOilModel::order('id desc')->select();
        if($start!=""&&$end!=""){
            $end.="23:59:59";
            $oil_app=OilAppliModel::order('id desc')->whereTime("create_time",'between',[$start,$end])->select();
            $sale=OilSaleModel::order('id desc')->whereTime("create_time",'between',[$start,$end])->select();
            $car_oil=CarOilModel::order('id desc')->whereTime("create_time",'between',[$start,$end])->select();
        }
        $arr=array();
        $j=0;
        foreach ($oil_app as $k=>$v){
            $v['type']="oil";
            $arr[$j++]=$v;
        }

        foreach ($sale as $k=>$v){
            $v['type']="sale";
            $arr[$j++]=$v;
        }


        foreach ($car_oil as $k=>$v){
            $v['type']="car_oil";
            $arr[$j++]=$v;
        }



        foreach ($arr as $k=>$v){
            foreach ($arr as $key=>$val){
                $time1=strtotime($v['update_time']);
                $time2=strtotime($val['update_time']);
                if($time1>=$time2){
                    $arr[$k]=$val;
                    $arr[$key]=$v;
                    break;
                }

            }
        }

        foreach ($arr as $k=>$v){
            foreach ($arr as $key=>$val){
                $time1=strtotime($v['update_time']);
                $time2=strtotime($val['update_time']);
                if($time1>=$time2){
                    $arr[$k]=$val;
                    $arr[$key]=$v;
                    break;
                }

            }
        }
        return $arr;

    }


}