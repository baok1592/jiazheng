<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/17 0017
 * Time: 10:44
 */

namespace app\controller\admin;


use app\service\TokenService;
use ruhua\bases\BaseController;
use app\model\Notice as NoticeModel;

class Notice extends BaseController
{
    /**
     * 添加通知
     */
    public function add()
    {
        $data=input('post.');
        $rule=[
            'content'=>'require'
        ];
        $this->validate($data,$rule);
        $data['operator']=TokenService::getCurrentTokenAid();
        $res=NoticeModel::create($data);
        return app('json')->go($res);
    }


    public function update()
    {
        $data=input('post.');
        $rule=[
            'content'=>'require',
            'id'=>'require'
        ];
        $this->validate($data,$rule);
        $dt=[
            'content'=>$data['content']
        ];
        $res=NoticeModel::update($dt,['id'=>$data['id']]);
        return app('json')->go($res);
    }


    public function get($start="",$end="")
    {
        $res=NoticeModel::with('operators')->order('sort asc')->order('create_time desc')->select();
        if($start!=""&&$end!="")
            $res=NoticeModel::with('operators')->whereTime('create_time','between',[$start,$end])->order('sort asc')->order('create_time desc')->select();
        return app('json')->go($res);
    }

    public function del($id)
    {
        $res=NoticeModel::destroy($id);
        return app('json')->go($res);
    }

}