<?php
include 'db.php';
session_start();
$uid=$_SESSION['mid'];
$cname=$_SESSION['cid'];
$sql="select * from (select * from paper where cname='{$cname}') as wp
where pid in (select distinct pid from record where user=$uid)";
$data=$mysql->query($sql)->fetch_all(1);

echo json_encode($data);
