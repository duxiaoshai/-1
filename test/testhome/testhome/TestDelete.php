<?php
include 'db.php';
//ids 是个数组
$sid=$_REQUEST['ids'];
//数组打散成字符串
$str=implode(',',$sid);
$sql="delete from paperextra where sid in ($str)";

$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}