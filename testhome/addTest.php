<?php
include 'db.php';
$pid=$_REQUEST['pid'];
$sids=$_REQUEST['sids'];

$str='';
for($i=0;$i<count($sids);$i++){
    $str.='('.$pid.','.$sids[$i].'),';
}
$str=substr($str,0,-1);

$sql="insert into paperextra (pid,tid) values $str";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}