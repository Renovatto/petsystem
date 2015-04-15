<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <title>Metronic | Admin Dashboard Template</title>
        <?php
        echo $this->Html->charset('UTF-8');
        echo $this->Html->meta('favicon.ico', '/favicon.ico');
        echo $this->Html->meta(array('name' => 'viewport', 'content' => 'width=device-width, initial-scale=1.0',
            'name' => 'MobileOptimized', 'content' => '320',
            'http-equiv' => 'X-UA-Compatible', 'content' => 'IE=edge'));

        //BEGIN GLOBAL MANDATORY STYLES -->
        echo $this->Html->css(array('/plugins/font-awesome/css/font-awesome.min',
            '/plugins/bootstrap/css/bootstrap.min',
            '/plugins/uniform/css/uniform.default'));

        // BEGIN PAGE LEVEL PLUGIN STYLES -->
        echo $this->Html->css(array('/plugins/jqvmap/jqvmap/jqvmap',
            '/plugins/gritter/css/jquery.gritter',
            '/plugins/bootstrap-daterangepicker/daterangepicker-bs3',
            '/plugins/fullcalendar/fullcalendar/fullcalendar',
            '/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart'));

        //END PAGE LEVEL PLUGIN STYLES -->
        //
    //BEGIN THEME STYLES -->
        echo $this->Html->css(array('style-metronic',
            'style',
            'style-responsive',
            'plugins',
            'pages/tasks',
            '/plugins/select2/select2_metro.css', //incluido 27/03/2014 - renovas
            '/plugins/data-tables/DT_bootstrap.css', //incluido 27/03/2014 - renovas
            'themes/default',
            'pages/error.css',
            'custom'));
        //END THEME STYLES -->
        //INICIO DOS SCRIPTS E PLUGINS DO TEMA
        echo $this->Html->script(array('/plugins/jquery-1.10.2.min.js',
            '/plugins/jquery-migrate-1.2.1.min.js',
            //Carregar jquery-ui-1.10.3.custom.min.js antes bootstrap.min.js para corrigir conflito.
            //Dica: jquery ui
            '/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js',
            '/plugins/bootstrap/js/bootstrap.min.js',
            '/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js',
            '/plugins/jquery-slimscroll/jquery.slimscroll.min.js',
            '/plugins/jquery.blockui.min.js',
            '/plugins/jquery.cookie.min.js',
            '/plugins/uniform/jquery.uniform.min.js',
            //FIM CORE PLUGINS
            //INICIO PAGE LEVEL PLUGINS
            '/plugins/jqvmap/jqvmap/jquery.vmap.js',
            '/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js',
            '/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js',
            '/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js',
            '/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js',
            '/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js',
            '/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js',
            '/plugins/flot/jquery.flot.js',
            '/plugins/flot/jquery.flot.resize.js',
            '/plugins/jquery.pulsate.min.js',
            '/plugins/bootstrap-daterangepicker/moment.min.js',
            '/plugins/bootstrap-daterangepicker/daterangepicker.js',
            '/plugins/gritter/js/jquery.gritter.js',
            // IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support
            '/plugins/fullcalendar/fullcalendar/fullcalendar.min.js',
            '/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.js',
            '/plugins/jquery.sparkline.min.js',
            //END PAGE LEVEL PLUGINS
            //BEGIN PAGE LEVEL SCRIPTS
            '/scripts/app.js',
            '/scripts/index.js',
            '/scripts/tasks.js',
            //END PAGE LEVEL SCRIPTS
            //INICIO PLUGINS DO DATA TABLES
            '/plugins/select2/select2.min.js',
            '/plugins/data-tables/jquery.dataTables.js',
            '/plugins/data-tables/DT_bootstrap.js',
            //'/scripts/table-editable.js',
            //'/scripts/table-managed.js'
            '/scripts/table-default.js'
                //FIM PLUGINS DATA TABLES
        ));
        ?>
    </head>
    <!-- END HEAD -->
    <!-- BEGIN BODY -->
    <body class="page-header-fixed">
        <?php
        echo $this->element('topo');
        echo $this->Session->flash();
        echo $this->fetch('content');
        echo $this->element('footer');

//echo $this->element('sql_dump');
        ?>
    </body>
</html>

<script>
    jQuery(document).ready(function() {
        App.init(); // initlayout and core plugins
        Index.init();
        Index.initJQVMAP(); // init index page's custom scripts
        Index.initCalendar(); // init index page's custom scripts
        Index.initCharts(); // init index page's custom scripts
        Index.initChat();
        Index.initMiniCharts();
        Index.initDashboardDaterange();
        Index.initIntro();
        Tasks.initDashboardWidget();
    });
</script>
