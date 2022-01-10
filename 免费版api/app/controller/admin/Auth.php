<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/11/5 0005
 * Time: 13:34
 */

namespace app\controller\admin;


use app\service\TokenService;
use ruhua\bases\BaseController;
use app\model\AuthGroup as AuthGroupModel;
use app\model\Admin as AdminModel;
use ruhua\exceptions\BaseException;
use think\facade\Log;
use think\facade\Request;
use app\model\AuthRule as AuthRuleModel;
use app\model\AuthGroupRule as AuthGroupRuleModel;


class Auth extends BaseController
{
    /**获取全部分组
     * @return mixed
     */
    public function get_group($type=0)
    {

        $group=AdminModel::where('id',1)->value('group_id');

        if($type==0)
            $res=AuthGroupModel::where('id','<>',$group)->order('id desc')->select();
        else
            $res=AuthGroupModel::order('id desc')->select();
        $arr=array();
        foreach ($res as $k=>$v){
            $v['rule_name']=$v['rules']['rule_name'];
            $rules=$v['rules']['rule_id'];
            unset($v['rules']);
            $v['rule_id']=$rules;
            $arr[$k]['id']=$v['id'];
            $arr[$k]['title']=$v['title'];
            $arr[$k]['create_time']=$v['create_time'];
            $arr[$k]['update_time']=$v['update_time'];
            $arr[$k]['rule_name']=$v['rule_name'];
            $arr[$k]['rules']=$rules;
        }
        return app('json')->go($arr);
    }

    /**添加分组
     * @return mixed
     * @throws BaseException
     */
    public function add_group()
    {
        $data=input('post.');
        $auth=AuthGroupModel::where('title',$data['title'])->find();
        if($auth){
            throw new BaseException(['msg'=>'名字重复']);
        }
        $res=AuthGroupModel::create($data);
        return app('json')->go($res);
    }

    /**更新分组
     * @return mixed
     */
    public function update_group()
    {
        $data=input('post.');
        if(isset($data['create_time']))
            unset($data['create_time']);
        if(isset($data['update_time']))
            unset($data['update_time']);
        $res=AuthGroupModel::update($data,['id'=>$data['id']]);
        return app('json')->go($res);
    }

    /**删除分组
     * @param $id
     * @return mixed
     * @throws BaseException
     */
    public function del_group($id)
    {
        $res=AdminModel::where('group_id',$id)->find();
        if($res){
            throw new BaseException(['msg'=>'该分组下有用户，不能删除']);
        }
        $res=AuthGroupModel::destroy($id);
        return app('json')->go($res);
    }

    /**添加规则
     * @return mixed
     */
    public function add_group_rule()
    {
        $data=input('post.');
        $res=AuthRuleModel::create($data);
        return app('json')->go($res);
    }

    /**删除规则
     * @param $id
     * @return mixed
     * @throws BaseException     */
    public function del_group_rule($id)
    {
        $rule=AuthRuleModel::where('pid',$id)->find();
        if($rule){
            throw new BaseException(['msg'=>'有子规则存在无法删除']);
        }
        $res=AuthRuleModel::destroy($id);
        return app('json')->go($res);
    }

    /**更新规则
     * @return mixed
     */
    public function update_group_rule()
    {
        $data=input('post.');
        $res=AuthGroupRuleModel::update($data,['id'=>$data['id']]);
        return app('json')->go($res);
    }

    public function get_group_rule()
    {
        $res=AuthRuleModel::with('rule')->select();
        return app('json')->go($res);
    }


    /**绑定规则给分组
     * @return mixed
     * @throws BaseException
     */
    public function add_enter_rule()
    {
        $data=input('post.');
        $group=AuthGroupModel::find($data['group']);
        if(!$group){
            throw new BaseException(['msg'=>'分组不存在']);
        }
        $rule=AuthRuleModel::find($data['rule']);
        if(!$rule){
            throw new BaseException(['msg'=>'规则不存在']);
        }
        $reg=AuthGroupRuleModel::where($data)->find();
        if($reg){
            throw new BaseException(['msg'=>'已存在']);
        }
        $res=AuthGroupRuleModel::create($data);
        return app('json')->go($res);
    }

    /**取消绑定
     * @param $id
     * @return mixed
     */
    public function cancel_enter_rule($id)
    {
        $res=AuthGroupRuleModel::destroy($id);
        return app('json')->go($res);
    }


    public function get_rule()
    {
        $data=AuthGroupRuleModel::select();
        return app('json')->go($data);
    }








}