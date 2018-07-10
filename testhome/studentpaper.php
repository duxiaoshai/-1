<?php
include 'db.php';
$pid=$_REQUEST['pid'];
$sql="select paper.pname,paperextra.*,tests.*,testtype.tid as st from paper,paperextra,tests,testtype where paper.pid=$pid and tests.sid=paperextra.tid and paperextra.pid=$pid and testtype.tname=tests.stype";
$data=$mysql->query($sql)->fetch_all(1);
echo json_encode($data);