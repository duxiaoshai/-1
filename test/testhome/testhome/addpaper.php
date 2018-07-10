<?php
include 'db.php';
$pname=$_REQUEST['pname'];
$cname=$_REQUEST['cname'];
session_start();
$uname=$_SESSION['user'];
$sql="INSERT INTO paper (pname,cname,uname) VALUES ('{$pname}','{$cname}','{$uname}')";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}