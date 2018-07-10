<?php
include 'db.php';
//var_dump($_REQUEST);
$name=$_REQUEST['name'];
$pass=md5($_REQUEST['pass']);
$type=$_REQUEST['type'];
$yz=$_REQUEST['yanzheng'];
session_start();
$code=$_SESSION['code'];
if($yz != $code) {
    echo 'error';
    exit;
}

    $sql = "select * from $type";
    $data = $mysql->query($sql)->fetch_all(1);
    for ($i = 0; $i < count($data); $i++) {
        if ($data[$i]['uname'] == $name) {
            if ($data[$i]['upass'] == $pass) {
                $_SESSION['user'] = $name;
                //如果登录更改路由返回登录页
                $_SESSION['isLogin']='yes';
                if($type == 'managestudent'){
                    $_SESSION['mid']=$data[$i]['mid'];
                    $_SESSION['cid']=$data[$i]['cid'];
                }
                echo '1';
                exit;
            } else {
                echo '2';
                exit;
            }
        }
    }
    echo '3';
