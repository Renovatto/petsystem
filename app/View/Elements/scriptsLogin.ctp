<?php

$scripts = array('/plugins/jquery-1.10.2.min.js',
    '/plugins/jquery-migrate-1.2.1.min.js',
    '/plugins/bootstrap/js/bootstrap.min.js',
    '/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js',
    '/plugins/jquery-slimscroll/jquery.slimscroll.min.js',
    '/plugins/jquery.blockui.min.js',
    '/plugins/jquery.cookie.min.js',
    '/plugins/uniform/jquery.uniform.min.js',
    '/plugins/jquery-validation/dist/jquery.validate.min.js',
    '/plugins/backstretch/jquery.backstretch.min.js',
    '/plugins/select2/select2.min.js',
    '/scripts/login-soft.js',
    '/scripts/app.js'
);

echo $this->Html->script($scripts);
