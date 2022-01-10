<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/8/29 0029
 * Time: 13:53
 */

namespace app\controller\admin;


use app\controller\common\Common;
use ruhua\bases\BaseController;
use app\model\Driver as DriveModel;
use app\model\Business as BusinessModel;
use ruhua\exceptions\BaseException;
use app\model\Admin as AdminModel;
use app\model\AuthGroup as AuthGroupModel;

class User extends BaseController
{

    public function add_user()
    {
        $data=input('post.');
        $rule=[
            'name'=>'require',
            'password'=>'require',
            'sex'=>'require',
            'mobile'=>'require',
            'group_id'=>'require'
        ];

        $this->validate($data,$rule);
        $data['password']=(new Common())->password($data['password']);
        $user=AdminModel::where('mobile',$data['mobile'])->find();
        if($user){
            throw new BaseException(['msg'=>'号码重复']);
        }
        $group=AuthGroupModel::find($data['group_id']);
        if(!$group)
            throw new BaseException(['msg'=>'分组不存在']);
        $res=AdminModel::create($data);
        return app('json')->go($res);
    }


    public function update_user()
    {
        $data=input('post.');
        $rule=[
            'name'=>'require',
            'sex'=>'require',
            'mobile'=>'require',
            'group_id'=>'require'
        ];
        if(isset($data['create_time']))
            unset($data['create_time']);
        if(isset($data['update_time']))
            unset($data['update_time']);
        $this->validate($data,$rule);
        $user=AdminModel::find($data['id']);
        if(!$user){
            throw new BaseException(['msg'=>'错误']);
        }
        $group=AuthGroupModel::find($data['group_id']);
        if(!$group)
            throw new BaseException(['msg'=>'分组不存在']);

        $res=$user->save($data);
        return app('json')->go($res);
    }

    public function del_user($id)
    {
        if($id==1){
            throw new BaseException(['msg'=>'无法删除用户']);
        }
        $res=AdminModel::destroy($id);
        return app('json')->go($res);
    }

    public function get_user()
    {
        $res=AdminModel::withoutField('password')->order('create_time desc')->select();
        return app('json')->go($res);
    }























    /**
     * 添加司机
     */
    public function add_driver()
    {
        $data=input('post.');
        $rule=[
            'name'=>'require',
            'mobile'=>'require',
            'sex'=>'require',
            'id_card'=>'require',
            'headpic'=>'require',
            '_id_card_z'=>'require',
            'id_card_back'=>'require',
            'xsz'=>'require',
            'jz'=>'require',
            'bank_name'=>'require',
            'bank_card'=>'require',
            'oil_card'=>'require'
        ];
        Common::check_mobile($data['mobile']);
        $this->validate($data,$rule);
        $list=DriveModel::where('mobile',$data['mobile'])->find();
        if($list){
            throw new BaseException(['msg'=>'号码已存在']);
        }

        $res=DriveModel::create($data);
        if($res){
            Common::add_mobile($data['mobile'],2);
        }
        return app('json')->go($res);
    }

    /**
     * 添加司机
     */
    public function update_driver()
    {
        $data=input('post.');
        $rule=[
            'name'=>'require',
            'sex'=>'require',
            'id_card'=>'require',
            'headpic'=>'require',
            '_id_card_z'=>'require',
            'id_card_back'=>'require',
            'xsz'=>'require',
            'jz'=>'require',
            'bank_name'=>'require',
            'bank_card'=>'require',
            'oil_card'=>'require',
            'id'=>'require'
        ];
        $this->validate($data,$rule);
        $res=DriveModel::update($data,['id'=>$data['id']]);
        return app('json')->go($res);
    }

    /**
     * 添加商家
     */
    public function add_shops()
    {
        $data=input('post.');
        $rule=[
            'mobile'=>'require',
            'name'=>'require',
            'sex'=>'require',
            'id_card'=>'require',
            'company_name'=>'require',
            'company_address'=>'require'
        ];
        $this->validate($data,$rule);
        $list=BusinessModel::where('mobile',$data['mobile'])->find();
        if($list){
            throw new BaseException(['msg'=>'号码已存在']);
        }
        Common::check_mobile($data['mobile']);

        $res=BusinessModel::create($data);
        if($res){
            Common::add_mobile($data['mobile'],1);
        }
        return app('json')->go($res);

    }

    /**
     * 删除司机
     */
    public function del_drive($id)
    {
        $res=DriveModel::destroy($id);
        return app('json')->go($res);
    }

    /**删除商家用户
     * @param $id
     */
    public function del_shops($id)
    {
        $res=BusinessModel::destroy($id);
        return app('json')->go($res);
    }

    /**获取商家信息
     * @return mixed
     */
    public function get_all_shops()
    {
        $list=BusinessModel::select();
        return app('json')->go($list);
    }

    public function update_shops()
    {
        $data=input('post.');
        $list=BusinessModel::where('id',$data['id'])->find();
        $modellist=BusinessModel::where('mobile',$data['mobile'])->find();
        if($modellist){
            if($modellist['id']!=$data['id'])
                throw new BaseException(['msg'=>'号码已存在']);
        }
        if(!$list){
            throw new BaseException(['msg'=>'商家不存在']);
        }
        $rule=[
            'mobile'=>'require',
            'name'=>'require',
            'sex'=>'require',
            'id_card'=>'require',
            'company_name'=>'require',
            'company_address'=>'require'
        ];
        $this->validate($data,$rule);
        $res=$list->save($data);
        return app('json')->go($res);
    }

    /**
     * 获取司机信息
     */
    public function get_driver()
    {
        $res=DriveModel::with(['head','fleets','car'])->select();
        return app('json')->go($res);
    }



}