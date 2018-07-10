<?php
include 'db.php';
$tid=$_REQUEST['tid'];
$sql="select * from manageteacher where tid=$tid";
$data=$mysql->query($sql)->fetch_assoc();
echo json_encode($data);