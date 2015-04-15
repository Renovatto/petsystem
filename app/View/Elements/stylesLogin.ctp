<?php

//BEGIN GLOBAL MANDATORY STYLES
$css = array('/plugins/font-awesome/css/font-awesome.min',
    '/plugins/bootstrap/css/bootstrap.min',
    '/plugins/uniform/css/uniform.default',
    // BEGIN PAGE LEVEL PLUGIN STYLES
    '/plugins/jqvmap/jqvmap/jqvmap',
    '/plugins/gritter/css/jquery.gritter',
    '/plugins/bootstrap-daterangepicker/daterangepicker-bs3',
    '/plugins/fullcalendar/fullcalendar/fullcalendar',
    '/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart',
    //BEGIN THEME STYLES
    'style-metronic',
    'style',
    'style-responsive',
    'plugins',
    'pages/tasks',
    'pages/login-soft',
    '/plugins/select2/select2_metro.css', //incluido 27/03/2014 - renovas
    '/plugins/data-tables/DT_bootstrap.css', //incluido 27/03/2014 - renovas
    'themes/default',
    'custom');





echo $this->Html->css($css);
