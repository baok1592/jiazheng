<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/8/29 0029
 * Time: 13:48
 */

namespace app\controller\user;


use app\controller\common\Common;
use app\controller\common\Wl;
use app\controller\drive\CarLine;
use ruhua\bases\BaseController;
use app\model\Plan as PlanModel;
use app\model\Imgs as ImgsModel;
use app\controller\drive\CarLine as DriveCarLine;
use think\App;

class Order extends BaseController
{
    private $mobile;

    public function __construct()
    {
        $this->mobile='18788778419';
    }

    /**用户获取所有订单
     * @param $mobile
     * @param $code
     * @return mixed
     */
    public function get_order($order_num='')
    {

        $time = time();    //获取当前时间戳
        $beforetime = $time - 2592000;     //三十天前的时间戳=当前时间戳-30天时间戳
        if($order_num!='')
            $list=PlanModel::with(['wl','car','driver'])->where(['mobile'=>$this->mobile,'order_num'=>$order_num])->
            whereTime('create_time','between',[$beforetime, $time])
                ->order('update_time desc')->select();
        else
            $list=PlanModel::with(['wl','car','driver'])->where(['mobile'=>$this->mobile])->
                whereTime('create_time','between',[$beforetime, $time])->order('update_time desc')->select();

        return app('json')->go($list);
    }

    /**
     * 订单编号查询物流(使用中)
     */
    public function get_order_by_num($order_num)
    {
        $list=PlanModel::with('wl')->where('order_num',$order_num)->order('update_time desc')->find();
        return app('json')->go($list);
    }



}