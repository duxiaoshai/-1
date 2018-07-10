<?php
include 'db.php';
$pid=$_REQUEST['pid'];
$pname=$_REQUEST['pname'];
$cname=$_REQUEST['cname'];
session_start();
$uname=$_SESSION['user'];
$sql="UPDATE paper SET pname='{$pname}',cname='{$cname}',uname='{$uname}' WHERE pid=$pid";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}