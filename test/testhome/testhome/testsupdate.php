<?php
include 'db.php';
$sid=$_REQUEST['sid'];
$sname=$_REQUEST['sname'];
$stype=$_REQUEST['stype'];
$stitle=$_REQUEST['stitle'];
$sexp=$_REQUEST['sexp'];
$sanswer=$_REQUEST['sanswer'];
$score=$_REQUEST['score'];

$sql="UPDATE tests SET sname='{$sname}',stype='{$stype}',stitle='{$stitle}',sexp='{$sexp}',sanswer='{$sanswer}',score='{$score}' WHERE sid=$sid";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}