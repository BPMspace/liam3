<?php
//echo "---TRANSITION--->";

// [Hash Password]
$param['row']['liam3_User_firstname'] = trim($param['row']['liam3_User_firstname']);
$param['row']['liam3_User_lastname'] = trim($param['row']['liam3_User_lastname']);
$data = $param['row'];
$allow = false;
$msg = 'Please enter all the fields';

// Check if required fields are not empty
if ($data['liam3_User_firstname'] && $data['liam3_User_lastname'] && $data['liam3_User_password']) {
    // Check if password is more than 10 characters
    if (strlen($data['liam3_User_password']) < 10) {
        $msg = 'The password must have at least 10 characters.';
    } elseif (!preg_match("#[0-9]+#", $data['liam3_User_password'])) {
        $msg = "Password must include at least one number!";
    } elseif (!preg_match("#[a-z]+#", $data['liam3_User_password'])) {
        $msg = "Password must include at least one lowercase letter!";
    } elseif (!preg_match("#[A-Z]+#", $data['liam3_User_password'])) {
        $msg = "Password must include at least one uppercase letter!";
    } else {
        $allow = true;
        $salt = bin2hex(openssl_random_pseudo_bytes(64));
        $hashedPassword = hash('sha512', $data['liam3_User_password'] . $salt);
        $param['row']['liam3_User_password'] = $hashedPassword;
        $param['row']['liam3_User_salt'] = $salt;
        $msg = "OK";
    }
    if (!preg_match("/^[a-zA-Z\s\pL]+$/u", $data['liam3_User_firstname'])) {
        $allow = false;
        $msg = "Please enter correct First Name";
    }
    if (!preg_match("/^[a-zA-Z\s\pL]+$/u", $data['liam3_User_lastname'])) {
        $allow = false;
        $msg = "Please enter correct Last Name";
    }
}

if (isset($data['new_email']) && $data['new_email'] && $allow) {
    $result = api(array(
        "cmd" => "create",
        "param" => array(
            "table" => "liam3_email",
            "row" => [
                "liam3_email_text" => $data['new_email'],
                "only_verify_mail" => true
            ]
        )
    ));
    $result = json_decode($result, true);
    $allow = (count($result) == 2);
    if ($allow) {
        $param['row']['created_email_id'] = $result[1]["element_id"];
    } else {
        $msg = $result[0]['message'];
    }
    // TODO: Create a link between user - mail
    /*api(["cmd" => "create", "param" => ["table" => "liam3_user_email",
        "row" => ["liam3_User_id_fk_164887" => $data['new_email'], "only_verify_mail" => true ]
    ]]);*/

} elseif (isset($data['liam3_User_email_id']) && $data['liam3_User_email_id'] && $allow) {
    $param['row']['created_email_id'] = $data['liam3_User_email_id'];
} else {
    $allow = false;
    if (!$msg || $msg == 'OK') $msg = 'Please enter all the fields';
}

$script_result = array(
    "allow_transition" => $allow,
    "show_message" => true,
    "message" => $msg
);