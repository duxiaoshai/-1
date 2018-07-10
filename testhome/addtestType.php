<?php
include 'db.php';
$tname=$_REQUEST['tname'];
$sql="INSERT INTO testType (tname) VALUES ('{$tname}')";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}