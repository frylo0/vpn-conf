<?php

require_once __DIR__ . '/pass-protect.php';

shell_exec('sudo /sbin/reboot');

echo "Перезагрузка сервера запущена... Обычно это занимает в районе минуты! Не перезагружай эту страницу, каждая загрузка страницы вызывает перезагрузку сервера";

