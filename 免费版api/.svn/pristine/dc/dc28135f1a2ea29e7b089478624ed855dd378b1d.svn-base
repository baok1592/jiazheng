<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/5 0005
 * Time: 10:57
 */

namespace app\controller\admin;


use app\service\QrcodeServer;
use ruhua\bases\BaseController;
use app\model\Park as ParkModel;
use ruhua\exceptions\BaseException;

class Park extends BaseController
{
    /**
     * 添加停车场所
     */
    public function add_park()
    {
        $data=input('post.');
        $rule=[
            'name'=>'require',
            'fee'=>'require',
            'position'=>'require',
        ];
        $this->validate($data,$rule);
        $list=ParkModel::where('name',$data['name'])->find();
        if($list){
            throw new BaseException(['msg'=>'名称重复']);
        }
        $res=ParkModel::create($data);
        $code="park:".$res['id'];
        $img=(new QrcodeServer())->getCodeUrl($code,"park");
        $res=$res->save(['qrcode'=>$img['id']]);
        return app('json')->go($res);
    }

    /**更新停车场所
     * @return mixed
     */
    public function update_park()
    {
        $data=input('post.');
        $res=ParkModel::update($data,['id'=>$data['id']]);
        return app('json')->go($res);
    }

    /**删除停车场所
     * @param $id
     * @return mixed
     */
    public function del_park($id)
    {
        $res=ParkModel::destroy($id);
        return app('json')->go($res);
    }

    /**获取所有停车场所
     * @return mixed
     */
    public function get_park()
    {
        $res=ParkModel::select();
        return app('json')->go($res);
    }

    /**id获取停车场所
     * @param $id
     * @return mixed
     */
    public function get_park_id($id)
    {
        $res=ParkModel::where('id',$id)->find();
        return app('json')->go($res);
    }
}