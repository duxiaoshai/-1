<?php
include 'db.php';
$sid=$_REQUEST['sid'];
$sql="select * from tests where sid=$sid";
$data=$mysql->query($sql)->fetch_assoc();
echo json_encode($data);