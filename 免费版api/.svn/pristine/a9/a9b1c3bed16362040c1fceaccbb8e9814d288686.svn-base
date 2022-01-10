<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/8 0008
 * Time: 15:02
 */

namespace app\controller\worker;


use app\controller\common\Wl;
use ruhua\bases\BaseController;

class KdWorker extends BaseController
{
    /**
     * 添加运输定位信息
     */
    public function add_trans()
    {
        $data=input('post.');
        $res=Wl::trans($data['order_id'],$data['arrive'],$data['target']);
        return app('json')->go($res);
    }

    public function add_peisong($order_id)
    {
        $res=Wl::paisong($order_id);
        return app('json')->go($res);
    }
}