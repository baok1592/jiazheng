<?php
include_once 'Socket.php';
include_once 'mysql.php';

$server = new Swoole\Server("0.0.0.0", 9919);
$socket=new Socket();
$server->on('connect', function ($server, $fd){
    echo "connection open: {$fd}\n";

});

//设备接收信息处理
$server->on('receive', function ($server, $fd, $reactor_id, $data) {
    echo $data."\n";

   // Swoole\Timer::clearAll();



    $arr=do_arr($data);
    if(count($arr)>2)
        choose($arr,$fd);


    $uid=get_uid_fd($fd);
    $car=(new Socket())->get_car_id($uid);

    /**
     * 5-15分钟APP语音提示
     */
  /*  $timer=Swoole\Timer::after(900000, function() use ($car){
        $data="d_warring,{$car[0]['uid']}";
        $car_id=$car[0]['uid'];
        send_data_admin($data);
        echo "已超时\n";
        Swoole\Timer::tick(120000, function () use ($car_id){
            $data="d_warring,{$car_id}";
            send_data_admin($data);
            echo "已超时2秒\n";
        });
    });*/

    /**
     * 超过20分钟短信提醒司机
     */
  /*  Swoole\Timer::after(1200000, function () use ($car){
        $data="ad_warring,{$car[0]['uid']}";
        send_data_admin($data);
        echo "已通知管理员\n";
        Swoole\Timer::tick(30000, function () use ($car){
            $data="ad_warring,{$car[0]['uid']}";
            echo $data."\n";
            send_data_admin($data);
            echo "已通知管理员\n";
        });
    });*/

    $server->send($fd, "Swoole: OKOK");

});
$server->on('close', function ($server, $fd) {
    echo "connection close: {$fd}\n";
});



$server->start();


function choose($data,$fd)
{
    global $socket;
    global $server;
    bind_user($data,$fd);
    $server->send($fd,"recive OK");

    $car=$socket->update_position($data);
    $dt[0]='car';
    $dt[1]=$car['id'];
    $dt[2]=$data['lat'];
    $dt[3]=$data['lng'];
    $dt[4]=$car['car_num'];
    //send_admin($dt);
}

/**绑定uid
 * @param $uid
 * @param $fd
 */
function bind_user($data,$fd)
{
    global $server;


    $info=$server->getClientInfo($fd);
    if(!isset($info['uid'])){
        $res=(new mysql())->select("select *from ys_car WHERE equip_num='{$data['num']}'");
        print_r($res);
        $server->bind($fd,$res[0]['id']);
        $server->send($fd,"bind OK");
    }
}

/**获取uid
 * @param $uid
 * @param $fd
 */
function get_uid_fd($fd)
{
    global $server;


    $info=$server->getClientInfo($fd);
    if(isset($info['uid'])){
       return $info['uid'];
    }
    return 0;
}

/**
 * 发送到管理员
 */
function send_admin($data)
{
    $str='';
    foreach ($data as $k=>$v){
        $str.=$v.",";
    }
    set_time_limit(0);

    $host = "127.0.0.1";
    $port = 2346;
    $socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP)or die("Could not create  socket\n");

    $connection = socket_connect($socket, $host, $port) or die("Could not connet server\n");
    socket_write($socket, $str);
    socket_close($socket);
}

function send_data_admin($data)
{
    set_time_limit(0);

    $host = "127.0.0.1";
    $port = 2346;
    $socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP)or die("Could not create  socket\n");

    $connection = socket_connect($socket, $host, $port) or die("Could not connet server\n");
    socket_write($socket, $data);
    socket_close($socket);
}

function get_fd_user($uid)
{
    $start_fd = 0;
    global $server;
    while(true)
    {
        $conn_list = $server->getClientList($start_fd, 100);
        if ($conn_list===false or count($conn_list) === 0)
        {
            break;
        }
        $start_fd = end($conn_list);

        foreach($conn_list as $fd)
        {
            $user=$server->getClientInfo($fd);
            if($user['uid']==$uid){
                //$this->server->push($fd, 'talk');
                return $fd;

                // break;
            }else {
                // code...
            }
        }
    }

}

function do_arr($data)
{
    $arr=explode(',',$data);
    $dt=array();
    if(count($arr)>10){
        $dt['num']=$arr[1];
        $lng=$arr[5];
        $lng1=substr($lng,0,2);
        $lng2=substr($lng,2,2);
        $lng3=substr($lng,5,4);
        $dt['lng']=(float)$lng1+(float)$lng2/60+(float)$lng3/(100*3600);
        $lat=$arr[7];
        $lat1=substr($lat,0,3);
        $lat2=substr($lat,3,2);
        $lat3=substr($lat,6,4);
        echo "lat1:$lat1"."\n";
        echo "lat2:$lat2"."\n";
        echo "lat3:$lat3"."\n";
        $dt['lat']=(float)$lat1+(float)$lat2/60+(float)$lat3/(100*3600);
        $car=(new Socket())->get_car($dt['num']);
        $dt['car_id']=$car['id'];
        $dt['speed']=$arr[9];
        $dt['direction']=$arr[10];
    }
    return $dt;
}



