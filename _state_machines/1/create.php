<?php
	//echo "---CREATE--->";

	// Validate Mail

	$msg = '';
	$allow = false;

	$email = $param['row']['liam3_email_text'];
	if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
		$allow = true;
	} else {
		$msg = 'This Mail is incorrect!';
	}

	if ($allow) {
	// Check if it already exists in the table
	$result = api(array(
		"cmd" => "read",
		"param" => array(
			"table" => "liam3_email",
			"filter" => '{"=":["liam3_email_text","'.$email.'"]}'
		)
	));
	$result = json_decode($result, true);
	if (count($result["records"]) == 0) {
		$msg = "Email created.";
		$allow = true;
	} else {
		$msg = "The Mail already exists!";
		$allow = false;
	}
	}

	$script_result = array(
		"allow_transition" => $allow,
		"show_message" => true,
		"message" => $msg
	);