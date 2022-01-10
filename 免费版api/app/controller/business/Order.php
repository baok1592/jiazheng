<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/8 0008
 * Time: 14:52
 */

namespace app\controller\business;


use ruhua\bases\BaseController;
use app\controller\common\Common;
use app\model\Plan as PlanModel;
use app\controller\common\Wl;

class Order extends BaseController
{


    /**商家获取订单
     * @return mixed
     */
    public function get_order()
    {
        $uid=4;
        $list=PlanModel::with(['wl','car','driver'])->where(['bid'=>$uid])->order('update_time desc')->select();
        return app('json')->go($list);

    }

}