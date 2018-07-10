<?php
include 'db.php';
$uname=$_REQUEST['uname'];
$tsex=$_REQUEST['tsex'];
$tnum=$_REQUEST['tnum'];
$did=$_REQUEST['did'];
$sid=$_REQUEST['sid'];
$cid=$_REQUEST['cid'];
$sql="INSERT INTO manageteacher (uname,upass,tsex,tnum,did,sid,cid) VALUES ('{$uname}',md5(12345),'{$tsex}','{$tnum}','{$did}','{$sid}','{$cid}')";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}