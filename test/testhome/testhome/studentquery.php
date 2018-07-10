<?php
include 'db.php';
$mid=$_REQUEST['mid'];
$sql="select * from managestudent where mid=$mid";
$data=$mysql->query($sql)->fetch_assoc();
echo json_encode($data);