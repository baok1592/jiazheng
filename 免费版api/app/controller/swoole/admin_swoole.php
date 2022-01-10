<?php
include_once 'mysql.php';

$server = new Swoole\Server("0.0.0.0", 2346);

$server->on('connect', function ($server, $fd){
    echo "connection open: {$fd}\n";
});

$server->on('receive', function ($server, $fd, $reactor_id, $data) {
    $list=explode(',',$data);
    echo $list[0]."\n";
    if($list[0]=='car'||$list[0]=="ad_warring"){
        send_admin($data);
    }
    if($list[0]=='admin'){
        bind_admin($list,$fd);
    }
    if($list[0]=='driver')
        bind_driver($list,$fd);
    if($list[0]=="d_warring"){
        warring_driver($list[1]);
    }



});
$server->on('close', function ($server, $fd) {
    echo "connection close: {$fd}\n";
});

$server->start();

/**
 * 管理员绑定
 */
function bind_admin($data,$fd)
{
    global $server;
    /**
     * data=['类型','电话','token']
     */
    $info=$server->getClientInfo($fd);
    if(!isset($info['uid'])){
        $sql="select *from ys_admin WHERE mobile='{$data[1]}' and code= '{$data[2]}'";
        $res=(new mysql())->select($sql);
        if($res){
            $server->bind($fd,0);
            $server->send($fd,"bind OK");
        }else{
            $server->send($fd,"mobile or code error");
        }

    }
}
function warring_driver($uid)
{
    $fd=get_fd_user($uid);

    global $server;
    $data="warring,$uid";
    $server->send($fd,$data);
}

/**
 * @param $data  0类型1id
 * @param $fd
 */
function bind_driver($data,$fd)
{

    global $server;
    $server->bind($fd,$data[1]);
    $server->send($fd,"bind OK");
}

/**
 * 发送数据到管理员端
 */
function send_admin($data)
{
    global $server;

    $admin_fd=get_fd_user(0);
    $server->send($admin_fd,$data);


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


function get_fd_user($uid)
{
    $start_fd = 0;
    global $server;
    while(true)
    {
        $conn_list = $server->getClientList($start_fd, 100);

        if ($conn_list===false or count($conn_list) === 0)
        {
            echo "finish\n";
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

