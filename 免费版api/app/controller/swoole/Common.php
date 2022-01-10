<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/7 0007
 * Time: 16:17
 */

class Common
{
    private $url;

    public function __construct()
    {
        $common=new mysql();
        $res=$common->select("select *from ys_sys_config where `key`='api_url'");
        $this->url=$res[0]['value'];
        echo $this->url."\n";

       // $this->url
    }

    function curl_get($url, &$httpCode = 0)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->url.$url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);

        //不做证书校验,部署在linux环境下请改为true
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
        $file_contents = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        curl_close($ch);
        return $file_contents;
    }

    function curl_post($url, array $params = array())
    {

        $data_string = json_encode($params);
        echo $this->url.$url."\n";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->url.$url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER,
            array(
                'Content-Type: application/json',
            )
        );
        $data = curl_exec($ch);
        curl_close($ch);
        return ($data);
    }
}