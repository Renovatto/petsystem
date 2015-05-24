<!DOCTYPE html>
<!--[if IE 8]> <html lang="pt-BR" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="pt-BR" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="pt-BR" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <title>Metronic | Admin Dashboard Template</title>

        <?php
        echo $this->Html->charset('UTF-8');
        echo $this->Html->meta('favicon.ico', '/favicon.ico');
        echo $this->Html->meta(array('name' => 'viewport',
            'content' => 'width=device-width, initial-scale=1.0',
            'name' => 'MobileOptimized',
            'content' => '320',
            'http-equiv' => 'X-UA-Compatible',
            'content' => 'IE=edge'));

        echo $this->element('styles');
        echo $this->element('scripts');
        ?>
    </head>
    <body class="page-header-fixed page-footer-fixed">
        <!-- page-sidebar-closed para fechar o menu lateral-->
        <!-- page-sidebar-fixed  para fixa o menu lateral-->
        <!-- page-footer-fixed para fixar o footer by -->
        <?php
        echo $this->element('topo');
        echo $this->Session->flash();
        echo $this->fetch('content');
        echo $this->element('footer');
        ?>
    </body>

</html>

<script>
    jQuery(document).ready(function () {
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
<?php
echo $this->element('sql_dump');
?>
