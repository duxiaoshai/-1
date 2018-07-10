<?php
include 'db.php';
$sid=$_REQUEST['sid'];
$sql="delete from tests where sid=$sid";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}