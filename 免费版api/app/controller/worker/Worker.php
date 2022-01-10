<?php

namespace app\controller\worker;

use app\controller\common\Common;
use app\service\TokenService;
use ruhua\bases\BaseController;
use app\model\Worker as WorkerModel;
use ruhua\exceptions\BaseException;

class Worker extends BaseController
{
    public static function login($data)
    {
        $res=Common::checkCode($data['mobile'],$data['code']);
        if($res){
            $worker=WorkerModel::where('mobile',$data['mobile'])->find();
            if(!$worker){
                throw new BaseException(['msg'=>'号码不存在']);
            }
            $dt=[
                'wid'=>$worker['id'],
                'name'=>$worker['name']
            ];
            $res=(new TokenService())->saveCache($dt);
            return $res;
        }
        return null;
    }


    public function get_infor()
    {
        $uid=2;
        $res=WorkerModel::where('id',$uid)->find();
        return app('json')->go($res);
    }
}