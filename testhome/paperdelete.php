<?php
include 'db.php';
$pid=$_REQUEST['pid'];
$sql="delete from paper where pid=$pid";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}