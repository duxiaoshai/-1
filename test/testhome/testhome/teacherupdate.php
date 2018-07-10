<?php
include 'db.php';
$tid=$_REQUEST['tid'];
$uname=$_REQUEST['uname'];
$tsex=$_REQUEST['tsex'];
$tnum=$_REQUEST['tnum'];
$did=$_REQUEST['did'];
$sid=$_REQUEST['sid'];
$cid=$_REQUEST['cid'];
$sql="UPDATE manageteacher SET 
uname='{$uname}',
tsex='{$tsex}',
tnum='{$tnum}',
did='{$did}',
sid='{$sid}',
cid='{$cid}'
 WHERE tid=$tid";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}