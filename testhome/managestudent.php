<?php
include 'db.php';
$sql="select mid,uname,msex,mnum,cid,sid,did from managestudent";
$data=$mysql->query($sql)->fetch_all(1);
echo json_encode($data);