<?php
include 'db.php';
$did=$_REQUEST['did'];
$sql="select * from stage where did=$did";
$data=$mysql->query($sql)->fetch_all(1);
echo json_encode($data);