<?php
declare (strict_types = 1);

namespace app\model;

use ruhua\bases\BaseModel;
use think\facade\Log;
use ruhua\exceptions\BaseException;
use app\controller\common\Common;
use app\service\TokenService;



class Business extends BaseModel
{

    /**登录
     * @param $data
     * @return array|null
     * @throws BaseException
     */
    public static function login($data)
    {
        $list=self::where('mobile',$data['mobile'])->find();
        if(!$list){
            throw new BaseException(['msg'=>'非商家号码']);
        }
        $check=Common::checkCode($data['mobile'],$data['code']);
        if($check){
            $chache=[
                'drive_id'=>$list['id'],
                'group'=>'drive'
            ];
            $res=(new TokenService())->saveCache($chache);
            return $res;
        }else{
            return null;
        }
    }
    public function getSexAttr($value)
    {
        $sex=['女','男'];
        return $sex[$value];
    }
}
