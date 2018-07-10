<?php
include 'db.php';
$cid=$_REQUEST['cid'];
$cname=$_REQUEST['cname'];
$did=$_REQUEST['did'];
$sid=$_REQUEST['sid'];
$sql="UPDATE classes SET cname='{$cname}',did='{$did}',sid='{$sid}' WHERE cid=$cid";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}