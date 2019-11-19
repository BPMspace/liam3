<?php
/*
$data = $param['row'];
$allow = true;
$msg = 'OK';
// Successfully created the Mail
if (isset($data['created_email_id'])) {
    $result = api(array(
        "cmd" => "create",
        "param" => array(
            "table" => "liam3_user_email",
            "row" => [
                "liam3_User_id_fk_164887" => $data['liam3_User_id'],
                "liam3_email_id_fk_396224" => $data['created_email_id']]
        )
    ));
}
$result = api(array(
"cmd" => "create",
"param" => array(
"table" => "role_user",
"row" => [
"role_id" => 9992,
"user_id" => $data['liam3_User_id']
]
)
));

$script_result = array(
    "allow_transition" => $allow,
    "show_message" => true,
    "message" => $msg
);*/