<?php
include 'db.php';
$tid=$_REQUEST['tid'];
$tname=$_REQUEST['tname'];
$sql="UPDATE testType SET tname='{$tname}' WHERE tid=$tid";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}