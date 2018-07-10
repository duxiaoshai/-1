<?php
include 'db.php';
$sids=$_REQUEST['sids'];
$answer=$_REQUEST['answer'];
$pid=$_REQUEST['pid'];

$str='';
session_start();
for($i=0;$i<count($sids);$i++){
    $str.='('.$sids[$i].',';
    if(is_array($answer['title'.$i])){
        //打散数组
        $s=implode(',',$answer['title'.$i]);
        $str.="'".$s."',";
    }else{
        $str.="'".$answer['title'.$i]."',";
    }
    $str.=$pid.",'".$_SESSION['mid']."'),";
}
$str=substr($str,0,-1);
$sql="insert into record (tid,answer,pid,user) values $str";
$mysql->query($sql);
if($mysql->affected_rows){
    echo 'ok';
}else{
    echo 'error';
}