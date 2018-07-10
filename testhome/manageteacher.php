<?php
include 'db.php';
$sql="select tid,uname,tsex,tnum,cid,sid,did from manageteacher";
$data=$mysql->query($sql)->fetch_all(1);
echo json_encode($data);