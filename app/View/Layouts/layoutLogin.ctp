<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
<!--        <title>Metronic | Admin Dashboard Template</title>-->
        <title>
            <?php
            //utilizado na view(ctp) por: $this->assign('title', 'Login | Acesso ao Sistema');
            //echo $this->fetch('title');
            //utilizado no controller por: $this->set('title_for_layout', 'Renovas');
            echo $title_for_layout;
            ?>
        </title>

        <?php
        echo $this->Html->charset('UTF-8');
        echo $this->Html->meta('favicon.ico', '/favicon.ico');
        echo $this->Html->meta(array('name' => 'viewport',
            'content' => 'width=device-width, initial-scale=1.0',
            'name' => 'MobileOptimized',
            'content' => '320',
            'http-equiv' => 'X-UA-Compatible',
            'content' => 'IE=edge'));

        echo $this->element('stylesLogin');
        echo $this->element('scriptsLogin');
        ?>
    </head>
    <body class="login">
        <!-- page-sidebar-closed para fechar o menu lateral-->
        <!-- page-sidebar-fixed  para fixa o menu lateral-->
        <!-- page-footer-fixed para fixar o footer by -->
        <?php
        //echo $this->Session->flash();
        echo $this->fetch('content');
        //echo $this->element('footer');
        ?>
    </body>

</html>

<script>
    jQuery(document).ready(function() {
        App.init(); // initlayout and core plugins
        Login.init();
    });
</script>
