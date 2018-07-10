<?php
include 'db.php';
//ids 是个数组
$mid=$_REQUEST['ids'];
//数组打散成字符串
$str=implode(',',$mid);
$sql="delete from managestudent where mid in ($str)";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}