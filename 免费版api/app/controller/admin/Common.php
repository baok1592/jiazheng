<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/12/9 0009
 * Time: 14:11
 */

namespace app\controller\admin;


use ruhua\bases\BaseController;
use Uedit\controller as Contro;

class Common extends BaseController
{

    /**
     *
     * @return mixed
     */
    public function ue_uploads()
    {
        $ue = new Contro;
        $res = $ue->show();
        return $res;
    }

    
}