<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/18 0018
 * Time: 10:41
 */

namespace app\controller\drive;


use ruhua\bases\BaseController;
use app\model\CarOil as CarOilModel;

class Oil extends BaseController
{
    /**
     * 司机获取加油记录
     */
    public function get_oil_record()
    {
        $uid=4;
        $res=CarOilModel::with(['plan'])->where('did',$uid)->order('id desc')->select();
        return app('json')->go($res);
    }
}