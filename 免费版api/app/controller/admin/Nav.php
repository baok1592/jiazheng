<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/5 0005
 * Time: 15:19
 */

namespace app\controller\admin;


use ruhua\bases\BaseController;
use app\model\Nav as NavModel;
use app\model\NavGroup as NavGroupModel;
use ruhua\exceptions\BaseException;
use app\model\AuthGroup as AuthGroupModel;

class Nav extends BaseController
{
    /**添加导航
     * @return mixed
     */
    public function add_nav()
    {
        $data=input('post.');
        $dt=[
            'name'=>$data['name'],
            'title'=>$data['title'],
            'pid'=>$data['pid']
        ];
        $res=NavModel::create($dt);
        return app('json')->go($res);
    }

    public function update_nav()
    {
        $data=input('post.');
        $res=NavModel::update($data,['id'=>$data['id']]);
        return app('json')->go($res);
    }

    public function get()
    {
        $res=NavModel::select();
        return app('json')->go($res);
    }

    public function delete($id)
    {
        $res=NavModel::destroy($id);
        return app('json')->go($res);
    }

    public function add_nav_group()
    {
        $data=input('post.');
        $nav=NavModel::where('id',$data['nav'])->find();
        if(!$nav){
            throw new BaseException(['msg'=>'菜单不存在']);
        }
        $group=AuthGroupModel::where('id',$data['group'])->find();
        if(!$group){
            throw new BaseException(['msg'=>'分组不存在']);
        }
        $reg=NavGroupModel::where($data)->find();
        if($reg){
            throw new BaseException(['msg'=>'重复添加']);
        }
        $res=NavGroupModel::create($data);
        return app('json')->go($res);
    }


    public function del_nav_group($id)
    {
        $res=NavGroupModel::destroy($id);
        return app('json')->go($res);
    }

}