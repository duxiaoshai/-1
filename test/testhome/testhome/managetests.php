<?php
include 'db.php';
$sql="select * from tests";
$data=$mysql->query($sql)->fetch_all(1);
echo json_encode($data);