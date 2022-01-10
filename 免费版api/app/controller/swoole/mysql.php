<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2020/9/7 0007
 * Time: 14:59
 */


class mysql
{
    private $dbh;
    public function __construct() {
        $this->dbh=$this->connDB();
    }

    public function connDB()
    {

        try {
            $dbh=new PDO("mysql:host=localhost;dbname=yswl","yswl","CRbMfpAYLRRxnMkk");

            $dbh->query("set names utf8");

        } catch (PDOException $e) {
            die('未能连接' . $e->getmessage());
        }
        return ($dbh);
    }

    /**
     * 增删改
     *
     */
    function query($sql)
    {
        return $this->dbh->exec($sql);

    }

    /*
 * 查询
 */
    function select($sql)
    {
        return $this->dbh->query($sql)->fetchAll();
    }


    function insert($data,$table)
    {
        $sql="insert into $table(";
        $i=0;
        foreach($data as $key => $value){
            if($key=="table"||$key=="func"){
                continue;
            }else{
                if($i==0){
                    $sql.="$key";
                }else{
                    $sql.=",$key";
                }
                $i++;
            }

        }
        $sql.=") values(";
        $i=0;
        foreach($data as $key => $value){

            if($key=="table"||$key=="func"){
                continue;
            }else{
                if($i==0){
                    $sql.="'$value'";
                }else{
                    $sql.=",'$value'";
                }
                $i++;
            }



        }
        $sql.=")";
        $res=$this->dbh->query($sql);
        return $res;
    }


    function update($data,$table)
    {
        $sql="update $table set";
        $id=$data['id'];

        $i=0;
        foreach($data as $key => $value){

            if($key=="table"||$key=="func"||$key=="id"){
                continue;
            }else{
                if($i>0){
                    $sql.=",";
                }
                $sql.=" $key='".$value."'";
                $i++;
            }


        }
        $sql.=" where id=$id";
        return query($sql);

    }

}