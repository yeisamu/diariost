<?php defined('BASEPATH') OR exit('No direct script access allowed');

$config = array(
    'protocol'      => 'smtp', // 'mail', 'sendmail', or 'smtp'
    'smtp_host'     => 'smtp.gmail.com', 
    'smtp_port'     =>  465,
    'smtp_user'     => 'gestioncoomocart@gmail.com',
    'smtp_pass'     => 'C00mocart',
    'smtp_crypto'   => 'ssl', //can be 'ssl' or 'tls' for example
    'mailtype'      => 'text', //plaintext 'text' mails or 'html'
    'smtp_timeout'  => '4', //in seconds
    'charset'       => 'utf-8',
    'wordwrap'      => TRUE
);