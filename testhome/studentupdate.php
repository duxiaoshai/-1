<?php
include 'db.php';
$mid=$_REQUEST['mid'];
$uname=$_REQUEST['uname'];
$msex=$_REQUEST['msex'];
$mnum=$_REQUEST['mnum'];
$did=$_REQUEST['did'];
$sid=$_REQUEST['sid'];
$cid=$_REQUEST['cid'];
$sql="UPDATE managestudent SET 
uname='{$uname}',
msex='{$msex}',
mnum='{$mnum}',
did='{$did}',
sid='{$sid}',
cid='{$cid}'
 WHERE mid=$mid";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}