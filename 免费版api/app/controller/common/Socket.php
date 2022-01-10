<?php

class swoole
{
    private $server;

    /**
     * 开始
     */
    public function All()
    {
        $this->server = new Swoole\WebSocket\Server("0.0.0.0", 2345);
        $this->server->on('open', function (Swoole\WebSocket\Server $server, $request) {
            echo "server: handshake success with fd{$request->fd}\n";
        });
        $this->server->on('message', function (Swoole\WebSocket\Server $server, $frame) {
            $data=$frame->data;
            $fd=$frame->fd;
            $data=json_decode($data, true);
            print_r($fd);
            echo $data;
            $this->do_data($data,$fd);

        });
        $this->server->on('close', function ($ser, $fd) {
            echo "client {$fd} closed\n";
        });
        $this->server->start();
    }

    /**数据处理
     * @param $data
     * @param $fd
     */
    public function do_data($data,$fd)
    {
        if(isset($data['type'])){
            if($data['type']=='bind')
                $this->bind_user($data['uid'],$fd);
            if($data['type']=='talk')
                $this->get_fd_user($data['eid']);

        }


    }

    /**绑定uid
     * @param $uid
     * @param $fd
     */
    public function bind_user($uid,$fd)
    {
        $info=$this->server->getClientInfo($fd);
        if(!isset($info['uid'])){
            $this->server->bind($fd,$uid);
            $this->server->push($fd, "绑定成功");
            print_r("fd:$fd;uid:$uid");
        }
    }

    /**
     * uid获取fid
     */
    public function get_fd_user($uid)
    {
        $start_fd = 0;
        while(true)
        {
            $conn_list = $this->server->getClientList($start_fd, 10);
            if ($conn_list===false or count($conn_list) === 0)
            {
                echo "finish\n";
                break;
            }
            $start_fd = end($conn_list);

            foreach($conn_list as $fd)
            {
                $user=$this->server->getClientInfo($fd);
                if($user['uid']==$uid){
                    $this->server->push($fd, 'talk');
                    // break;
                }else {
                    // code...
                }
            }
        }

    }


}
(new swoole())->All();