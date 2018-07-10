<?php
include 'db.php';
$did=$_REQUEST['did'];
$dname=$_REQUEST['dname'];
$sql="UPDATE direction SET dname='{$dname}' WHERE did=$did";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}