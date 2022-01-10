<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/12/10 0010
 * Time: 15:13
 */

namespace app\controller\common;


use app\model\Cw;
use ruhua\bases\BaseController;
use app\model\Plan as PlanModel;
use ruhua\exceptions\BaseException;
use ruhua\exceptions\OrderException;
use think\facade\Log;
use app\model\CarOil as CarOilModel;
use app\model\OilSale as OilSaleModel;
use app\model\Oil as OilModel;
use app\model\CarRepair as CarRepairModel;
use app\model\Cw as CwModel;

class Task extends BaseController
{
    /**
     * 1天定时任务、更新每天的财务信息
     */
    public function update_cw()
    {

        $car_num=PlanModel::whereTime('create_time','today')->sum('car_num');
        $weight=PlanModel::whereTime('create_time','today')->sum('weight');
        $yun_fee=PlanModel::whereTime('create_time','today')->sum('total_price');

        $plan=PlanModel::select();
        $xx_fee=0;
        foreach ($plan as $k=>$v){
            if($v['dd_json']&&isset($v['dd_json']['dd_time'])) {
                if($v['dd_json']['dd_time']!='')

                    if (strtotime($v['dd_json']['dd_time']) >= strtotime(date("Y-m-d")) && strtotime($v['dd_json']['dd_time']) <= time())
                    {
                        if(isset($v['dd_json']['msg_money']))
                            $xx_fee += $v['dd_json']['msg_money']*1.0;

                    }

            }

        }
        $car_fee=CarOilModel::whereTime('create_time','today')->sum('total');
        $oil=CarOilModel::whereTime('create_time','today')->sum('num');
        $sale_oil=OilSaleModel::whereTime('create_time','today')->sum('num');
        $oil_stock=OilModel::order('id desc')->value('stock');
        $car_repaire=CarRepairModel::whereTime('create_time','today')->select();
        $repair_fee=0;
        $gs_fee=0;
        foreach ($car_repaire as $k=>$v){

            $repair_fee+=$v['json']['total_money']*1.0;
            $gs_fee+=$v['json']['gsf_total'];
        }
        $dt=[
            'car_num'=>$car_num,
            'weight'=>$weight,
            'total_price'=>$yun_fee,
            'xx_fee'=>$xx_fee,
            'car_fee'=>$car_fee,
            'oil'=>round($oil,2),
            'oil_fee'=>round($oil,2),
            'sale_oil'=>$sale_oil,
            'oil_stock'=>$oil_stock,
            'oil_stock_fee'=>0,
            'repair_fee'=>$repair_fee,
            'gs_fee'=>$gs_fee
        ];
        $cw=CwModel::whereTime('create_time','today')->find();
        if($cw){
            $res=$cw->save($dt);
        }else
            $res=CwModel::create($dt);
    }


    public function get()
    {
        $res=CwModel::order('create_time desc')->select();
        return app('json')->go($res);
    }

    /**
     *
     */
    public function del_cw($id)
    {
        $res=CwModel::destroy($id);
        return app('json')->go($res);
    }
}