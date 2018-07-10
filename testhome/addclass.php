<?php
include 'db.php';
$cname=$_REQUEST['cname'];
$did=$_REQUEST['did'];
$sid=$_REQUEST['sid'];
$sql="INSERT INTO classes (cname,did,sid) VALUES ('{$cname}','{$did}','{$sid}')";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}