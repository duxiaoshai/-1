<?php
include 'db.php';
$pid=$_REQUEST['pid'];
session_start();
$uid=$_SESSION['mid'];
$sql="select record.*,tests.*  from record,tests where record.pid=$pid and record.user=$uid and tests.sid=record.tid";
$data=$mysql->query($sql)->fetch_all(1);
echo json_encode($data);