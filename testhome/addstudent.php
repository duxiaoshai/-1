<?php
include 'db.php';
$uname=$_REQUEST['uname'];
$msex=$_REQUEST['msex'];
$mnum=$_REQUEST['mnum'];
$did=$_REQUEST['did'];
$sid=$_REQUEST['sid'];
$cid=$_REQUEST['cid'];
$sql="INSERT INTO managestudent (uname,upass,msex,mnum,did,sid,cid) VALUES ('{$uname}',md5(12345),'{$msex}','{$mnum}',
'{$did}','{$sid}','{$cid}')";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}