<?php
	//echo "---TRANSITION--->";

	$data = $param['row'];
	$allow = true;
	$msg = 'Email successfully deleted.';
	$param['row']['liam3_email_text'] = hash('sha256', $param['row']['liam3_email_text']);
	
	$script_result = array(
		"allow_transition" => $allow,
		"show_message" => true,
		"message" => $msg
	);