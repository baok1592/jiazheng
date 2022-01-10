<?php
//include_once 'Socket.php';

$server = new Swoole\Server("0.0.0.0", 9919);
//$socket=new Socket();
$server->on('connect', function ($server, $fd){
    echo "connection open1: {$fd}\n";
});

$server->on('receive', function ($server, $fd, $reactor_id, $data) {
    $server->send($data, "hellow");
    //$server->send($data, "Swoole: {$arr}");

});
$server->on('close', function ($server, $fd) {
    echo "connection close: {$fd}\n";
});

$server->start();
