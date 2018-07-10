<?php
include 'db.php';
$sname=$_REQUEST['sname'];
$did=$_REQUEST['did'];
$sql="INSERT INTO stage (sname,did) VALUES ('{$sname}','{$did}')";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}