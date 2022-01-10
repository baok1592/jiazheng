<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/24 0024
 * Time: 10:51
 */

namespace app\controller\admin;


use ruhua\bases\BaseController;
use app\model\Parts as  PartsModel;
use app\model\Plan as PlanModel;
use app\model\Car as CarModel;
use think\facade\Db;
use think\facade\Log;

class Statistics extends BaseController
{
    /**库存统计
     * @return mixed
     *
     */
    public function parts_stock()
    {
        $list=PartsModel::with('partsrecord')->order('create_time desc')->select();
        return app('json')->go($list);
    }

    /**
     * 首页统计
     */
    public function index_data()
    {
        $sum=PlanModel::count();
        $pc=CarModel::where('state','<>',0)->count();
        $trans=PlanModel::where('status',1)->count();
        $finish=PlanModel::where('status',2)->count();
        $fleet=CarModel::field("distinct fleet")->order('create_time desc')->select();

        Db::startTrans();
        try{
            $car=array();
            foreach ($fleet as $k=>$v){
                $car[$k]=CarModel::where('fleet',$v['fleet'])->field('car_num,fleet')->select();
            }

            Db::commit();
        }catch (Exception $e){
            Db::rollback();// 回滚事务
            throw new ShopsException(['msg'=>$e->getMessage()]);
        }

        $data=[
            'sum'=>$sum,
            'pc'=>$pc,
            'trans'=>$trans,
            'finish'=>$finish,
            'car'=>$car
        ];
        return app('json')->go($data);
    }

}