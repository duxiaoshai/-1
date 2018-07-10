<?php
include 'db.php';
$sid=$_REQUEST['sid'];
$sname=$_REQUEST['sname'];
$did=$_REQUEST['did'];
$sql="UPDATE stage SET sname='{$sname}',did='{$did}' WHERE sid=$sid";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}