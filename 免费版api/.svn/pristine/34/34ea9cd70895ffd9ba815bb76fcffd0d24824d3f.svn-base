<?php
declare (strict_types = 1);

namespace app\model;

use ruhua\bases\BaseModel;
use ruhua\exceptions\BaseException;
use think\facade\Db;
use think\facade\Log;

class Imgs extends BaseModel
{
    public static function check_imgs($imgs)
    {

        $imgsModel=new Imgs();
        Db::startTrans();
        try{
            foreach ($imgs as $k=>$v){

                $img=$imgsModel->where('id',$v)->find();
                if(!$img){
                    return 0;
                }
            }
            Db::commit();
            return 1;
        }catch (\Exception $e){
            Db::rollback();
            throw new BaseException(['msg'=>$e->getMessage()]);
        }
    }
}
