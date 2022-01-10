<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/1 0001
 * Time: 10:09
 */

namespace app\controller\admin;


use app\model\PartsRecord;
use app\service\TokenService;
use ruhua\bases\BaseController;
use app\model\Parts as PartsModel;
use ruhua\exceptions\BaseException;
use app\model\PartsAppli as PartsPaaliModel;
use app\model\PartsRecord as PartsRecordModel;
use app\model\Car as CarModel;

class Parts extends BaseController
{
    /**
     * 添加零配件
     */
    public function add_type()
    {
        $data=input('post.');
        $rule=[
            'name'=>'require',
            'model'=>'require',
            'price'=>'require',
            'stock'=>'require',
            //'department'=>'require'
        ];

        $this->validate($data,$rule);
        if(!isset($data['department']))
            $data['department']=TokenService::getCurrentTokenGroup();
        $list=PartsModel::where(['name'=>$data['name'],'department'=>$data['department']])->find();
        if($list){
            throw new BaseException(['msg'=>'型号已存在']);

        }
        $res=PartsModel::create($data);
        return app('json')->go($res);
    }


    /**
     * 添加零配件
     */
    public function update_parts()
    {
        $data=input('post.');
        $rule=[
            'name'=>'require',
            'model'=>'require',
            'price'=>'require',
        ];

        $this->validate($data,$rule);
        if(!isset($data['department']))
            $data['department']=TokenService::getCurrentTokenGroup();
        $res=PartsModel::update(['name'=>$data['name'],'model'=>$data['model'],'num'=>$data['num'],'massege'=>$data['massege'],'price'=>$data['price']],['id'=>$data['id']]);
        return app('json')->go($res);
    }

    /**
     * 物品入库
     */
    public function  enter_parts()
    {
        $post=input('post.');
        if(!isset($post['department']))
            $post['department']=TokenService::getCurrentTokenGroup();
        $parts=PartsModel::where(['id'=>$post['id'],'department'=>$post['department']])->find();
        if(!$parts)
            throw new BaseException(['msg'=>'物资不存在']);

        $data=[
            'name'=>$parts['name'],
            'type'=>'入库',
            'num'=>$post['num'],
            'operator'=>TokenService::getCurrentTokenAid(),
            'user'=>$post['user'],
            'department'=>$post['department'],
            'msg'=>$post['massege'],
            'model'=>$post['model'],
            'price'=>$post['price']
        ];
        PartsRecordModel::create($data);
        $res=PartsModel::update(['stock'=>$parts['stock']+$post['num']],['id'=>$parts['id']]);
        return app('json')->go($res);

    }


    /**
     * 物品出库
     */
    public function  out_parts()
    {
        $post=input('post.');
        $rule=[
            'id'=>'require',
            'num'=>'require',
            'car_id'=>'require',
            'content'=>'require'
        ];
        if(!isset($post['department']))
            $post['department']=TokenService::getCurrentTokenGroup();
        $parts=PartsModel::where(['id'=>$post['id'],'department'=>$post['department']])->find();
        if(!$parts)
            throw new BaseException(['msg'=>'物资不存在']);
        if($parts['stock']<$post['num'])
            throw new BaseException(['msg'=>'库存不够']);
        $car_num=CarModel::where('id',$post['car_id'])->value('car_num');
        if(!$car_num)
            throw new BaseException(['msg'=>'车辆不存在']);

        $data=[
            'name'=>$parts['name'],
            'type'=>'出库',
            'num'=>$post['num'],
            'msg'=>$post['msg'],
            'operator'=>TokenService::getCurrentTokenAid(),
            'use_car'=>$car_num,
            'user'=>$post['user'],
            'department'=>$post['department'],
            'model'=>$post['model'],
            'price'=>$post['price'],
        ];
        PartsRecordModel::create($data);
        $res=$parts->save(['stock'=>$parts['stock']-$post['num']]);
        return app('json')->go($res);

    }


    /**删除物品
     * @param $id
     * @return mixed
     */
    public function del_parts($id)
    {
        $res=PartsModel::where(['id'=>$id])->delete();
        return app('json')->go($res);
    }

    /**s删除出入库记录
     * @param $id
     * @return mixed
     */
    public function del_parts_record($id,$department="")
    {

        $res=PartsRecordModel::where(['id'=>$id,'department'=>$department])->delete();
        return app('json')->go($res);
    }



    public function get_parts($group="",$start="",$end="")
    {

        if($group=="")
            $group=TokenService::getCurrentTokenGroup();
        $res=PartsModel::where('department',$group)->order('create_time desc')->select();
        if($start!=""&&$end!=""){
            $end.=" 23:59:59";
            $res=PartsModel::where('department',$group)->whereTime('create_time','between',[$start,$end])->order('create_time desc')->select();
        }

        return app('json')->go($res);

    }

    public function get_parts_record($group="",$start="",$end="")
    {
        if($group=="")
            $group=TokenService::getCurrentTokenGroup();
        $res=PartsRecordModel::with('operators')->where('department',$group)->order('create_time desc')->select();

        if($start!=""&&$end!=""){
            $end.=" 23:59:59";
            $res=PartsRecordModel::with('operators')->whereTime('create_time','between',[$start,$end])->where('department',$group)->order('create_time desc')->select();

        }
        return app('json')->go($res);
    }




















    /**
     * 零配件申购
     */
    public function appli()
    {
        $data=input('post.');
        $rule=[
            'parts'=>'require',
            'num'=>'require',
            'price'=>'require',
            'total'=>'require',
        ];
        $this->validate($data,$rule);
        $parts=PartsModel::where('id',$data['parts'])->find();
        if(!$parts){
            throw new BaseException(['msg'=>'零配件数据有误']);
        }
        $res=PartsPaaliModel::create($data);
        if($res){
            PartsModel::update(['stock'=>($parts['stock']+$data['num'])],['id'=>$parts['id']]);
        }
        return app('json')->go($res);
    }


    /**获取零配件申购
     * @return mixed
     */
    public function get_appli()
    {
        $res=PartsPaaliModel::select();
        return app('json')->go($res);
    }





}