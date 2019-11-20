<?php
//echo "---TRANSITION--->";

// [Write hashed Password]
$param['row']['liam3_User_firstname'] = trim($param['row']['liam3_User_firstname']);
$param['row']['liam3_User_lastname'] = trim($param['row']['liam3_User_lastname']);
$data = $param['row'];
$allow = true;
$msg = 'Please fill all the fields';
$change_password = false;


if (!isset($data['liam3_client_passwd_reset_form'])) {
    // Check if pwd and salt is not empty
    if (!$data['liam3_User_firstname'] || !$data['liam3_User_lastname']) {
        $allow = false;
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
if ($allow && isset($data['liam3_User_password_new'])) {
    //$new_password = isset($data['liam3_User_password_new']) ? $data['liam3_User_password_new'] : $data["liam3_User_password"];
    $new_password = $data['liam3_User_password_new'];
    // Check if password is more than 10 characters
    if (strlen($new_password) < 10) {
        $allow = false;
        $msg = 'The password must have at least 10 characters.';
    } elseif (!preg_match("#[0-9]+#", $new_password)) {
        $msg = "Password must include at least one number!";
        $allow = false;
    } elseif (!preg_match("#[a-z]+#", $new_password)) {
        $msg = "Password must include at least one lowercase letter!";
        $allow = false;
    } elseif (!preg_match("#[A-Z]+#", $new_password)) {
        $msg = "Password must include at least one uppercase letter!";
        $allow = false;
    } else {
        $msg = "OK.";
    }
    if ($allow && $data['liam3_User_password_old'] && $data['liam3_User_password_new'] && $data['liam3_User_password_new_confirm']) {
        if ($data['liam3_User_password_new'] !== $data['liam3_User_password_new_confirm']) {
            $allow = false;
            $msg = 'The new password and the confirmed password do not match';
        } else {
            if (hash('sha512', $data['liam3_User_password_old'] . $data['liam3_User_salt']) !== $data['liam3_User_password']) {
                $allow = false;
                $msg = 'The old password is incorrect';
            } else {
                $allow = true;
            }
        }
    } elseif ($allow && $data['liam3_User_password_new_confirm']) {
        if ($data['liam3_User_password_new'] !== $data['liam3_User_password_new_confirm']) {
            $allow = false;
            $msg = 'The new password and the confirmed password do not match';
        }
    }
    if ($allow == true) {
        $salt = bin2hex(openssl_random_pseudo_bytes(64));
        $hashedPassword = hash('sha512', $new_password . $salt);
        $param['row']['liam3_User_password'] = $hashedPassword;
        $param['row']['liam3_User_salt'] = $salt;
        $msg = "OK";
        $change_password = true;
    }
}

if ($allow) $msg = "OK";
/*if ($allow == true) {
    $salt = bin2hex(openssl_random_pseudo_bytes(64));
    $hashedPassword = hash('sha512', $new_password . $salt);
    $param['row']['liam3_User_password'] = $hashedPassword;
    $param['row']['liam3_User_salt'] = $salt;
    $msg = "OK";
    $change_password = true;
}*/

$script_result = array(
    "allow_transition" => $allow,
    "show_message" => true,
    "message" => $msg,
    "change_password" => $change_password
);