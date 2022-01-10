<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/17 0017
 * Time: 14:00
 */

namespace app\controller\admin;


use app\service\TokenService;
use ruhua\bases\BaseController;
use app\model\Banner as BannerModel;

class Banner extends BaseController
{
    public function add()
    {
        $data=input('post.');
        $rule=[
            'url'=>'require'
        ];
        $data['operator']=TokenService::getCurrentTokenAid();
        $this->validate($data,$rule);
        $res=BannerModel::create($data);
        return app('json')->go($res);
    }

    public function update()
    {
        $data=input('post.');
        $rule=[
            'url'=>'require',
            'id'=>'require'
        ];
        $this->validate($data,$rule);
        $res=BannerModel::update($data,['id'=>$data['id']]);
        return app('json')->go($res);
    }

    public function get($start="",$end="")
    {
        $res=BannerModel::with('operators')->select();
        if($start!=""&&$end!="")
            $res=BannerModel::with('operators')->whereTime('create_time','between',[$start,$end])->order('create_time desc')->select();
        return app('json')->go($res);
    }

    public function del($id)
    {
        $res=BannerModel::destroy($id);
        return app('json')->go($res);
    }
}