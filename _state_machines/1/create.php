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
        if (isset($param['row']['dont_send_email'])) {
            $msg = "Email created.";
        } else {
            $jwt_key = AUTH_KEY;
            $jwt_token = array(
                "iss" => "liam3",
                "aud" => $email,
                "iat" => time(),
                "exp" => time() + 10800
            );

            /**
             * IMPORTANT:
             * You must specify supported algorithms for your application. See
             * https://tools.ietf.org/html/draft-ietf-jose-json-web-algorithms-40
             * for a list of spec-compliant algorithms.
             */
            $jwt = JWT::encode($jwt_token, $jwt_key);

            // Mail Content
            $subject = "Verification";
            $link = API_URL_LIAM . "/liam3_Client_verify.php?token=" . $jwt;
            $msg = "Please verify your mail - <a href=$link>Click here to verify your email</a>";
            /*$subject = "Please confirm your Mail Adress";
            $link = API_URL_LIAM . "/liam3_Client_register.php?token=" . $jwt;
            $msg = "Hello, First line of text \n Second line of text <a href=$link>Click here to confirm your email</a>";*/
            $msg = str_replace('$link', $link, $msg);
            // Format and Send Mail
            $msg = wordwrap($msg, 70);
            /*if (!mail($email, $subject, $msg)) {
                $msg = "The email can\'t be send.";
                $allow = false;
            }*/
            //mail($email, $subject, $msg);
            $msg = 'A verification link has been sent to your email address.' . $msg;
        }
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