<?php
/**
 * Receiver
 *
 * @author     mole<mole1230@gmail.com>
 * @version    $Id: upload.php 8 2010-10-19 12:45:57Z mole1230 $
 */
$code = 'A00001';
move_uploaded_file($_FILES['Filedata']['tmp_name'], 'tmp/' . $_FILES['Filedata']['name']);
$response = array(
	'code' => $code,
	'message' => '',
	'data' => $_FILES
);
echo json_encode($response);