<?php
/**
 * Receiver
 *
 * @author     mole<mole1230@gmail.com>
 * @version    $Id: save.php 8 2010-10-19 12:45:57Z mole1230 $
 */

$data = null;
if (!empty($_SERVER['CONTENT_TYPE']) && strtolower($_SERVER['CONTENT_TYPE']) == 'application/octet-stream') {
	if (!empty($HTTP_RAW_POST_DATA)) {
		$data = $HTTP_RAW_POST_DATA;
	} else {
		$data = file_get_contents("php://input");
	}
}
$uid = (int) $_GET['uid'];
$uid = str_pad($uid, 6, '0');
$size = $_GET['size'];
$filename = $size . '_' . $uid . '.jpg';
$filepath = './tmp/' . $filename;
$length = file_put_contents($filepath, $data);
response('A00001');

function response($code, $data = '')
{
	$json = json_encode(array('code' => $code, 'data' => $data));
	echo $json;
	exit;
}
