<?php
include 'db.php';
$dname=$_REQUEST['dname'];
$sql="INSERT INTO direction (dname) VALUES ('{$dname}')";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}