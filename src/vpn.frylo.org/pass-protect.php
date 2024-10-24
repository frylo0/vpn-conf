<?php

require_once __DIR__ . '/creds.php';

// Проверяем, введены ли имя пользователя и пароль
if (!isset($_SERVER['PHP_AUTH_USER']) || !isset($_SERVER['PHP_AUTH_PW']) ||
    $_SERVER['PHP_AUTH_USER'] !== $valid_username || $_SERVER['PHP_AUTH_PW'] !== $valid_password) {

    // Если данные неверны, запрашиваем ввод имени и пароля
    header('WWW-Authenticate: Basic realm="Restricted Area"');
    header('HTTP/1.0 401 Unauthorized');
    echo 'Unauthorized';

    exit;
}

?>
