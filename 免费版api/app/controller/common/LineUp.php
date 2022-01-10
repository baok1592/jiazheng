<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/8/31 0031
 * Time: 15:57
 */

namespace app\controller\common;


use app\service\QrcodeServer;
use ruhua\bases\BaseController;
use app\model\LineUp as LineUpModel;
use app\model\Park as ParkModel;
use ruhua\exceptions\BaseException;
use app\model\Imgs as ImgsModel;
use think\facade\Log;

class LineUp extends BaseController
{
    /**
     * 查看排队情况
     */
    public function get_line()
    {
        $list=LineUpModel::with(['driver','car'])->select();
        return app('json')->go($list);
    }

    /**实时更新二维码
     * @param $id
     */
    public function up_qrcode($id)
    {
        $park=ParkModel::where('id',$id)->find();
        if(!$park){
            throw new BaseException(['msg'=>'数据错误']);
        }
        $img=ImgsModel::where('id',$park['qrcode'])->find();
        $url=$img['url'];
        if(file_exists(ROOT.$url)){
            unlink(ROOT.$url);
        }
        $rand=rand(100000,999999);
        $code="park:$id;code:$rand";
        $img=(new QrcodeServer())->getCodeUrl($code,"park",$img['id']);
        $res=$park->save(['qrcode'=>$img['id'],'code'=>$rand]);
        return app('json')->go($img);

    }

    public function statistics($model,$date_type=null,$cid=null,$did=null)
    {
        if($cid!=null)
            $model->where($cid);
        if($did!=null)
            $model->where($did);
        if($date_type!=null){
            $model->whereTime($this->trans_date_type($date_type));
        }
        return $model->select();
    }

    public function trans_date_type($type)
    {
        switch ($type){
            case "day":
                return ['create_time'=>'today'];
            case 'week':
                return ['create_time'=>'week'];
            case 'month':
                return ['create_time'=>'month'];
            case 'year':
                return ['create_time'=>'year'];
            default:
                return null;
        }

    }

}