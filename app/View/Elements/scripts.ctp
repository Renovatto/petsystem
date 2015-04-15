<?php

$scripts = array('/plugins/jquery-1.10.2.min.js',
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
    '/plugins/data-tables/jquery.dataTables.js',
    '/plugins/data-tables/DT_bootstrap.js',
    //'/scripts/table-editable.js',
    //'/scripts/table-managed.js'
    '/scripts/table-default.js',
    //FIM PLUGINS DATA TABLES
    //CAMPO SELECT COM PESQUISA
    '/plugins/select2/select2.min.js',
    '/plugins/fuelux/js/spinner.min.js',
    //FIM CAMPO SELECT COM PESQUISA
    //CAMPO DE CALENDARIO
    '/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js',
    //INPUT MASKS - TELEFONE, MOEDA, DINHEIRO
    '/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js',
    '/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js',
    //CONTADOR MAXLENGTH - EXIBE A CONTAGEM DO INPUT DE ACORDO COM O MAXLENGTH
    '/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js',
    //CONTROLA TODOS OS COMPONENTES DE MASCARA, DATA, MAXLENGTH E POSSUI DOIS PLUGINS DEPENDENTES IP_ADDRESSS E MULTI-SELECT
    '/scripts/form-components.js',
    '/plugins/jquery.input-ip-address-control-1.0.min.js',
    '/plugins/jquery-multi-select/js/jquery.multi-select.js',
    //COMPONENTE DE ABAS
    '/scripts/form-samples.js',
    '/scripts/portlet-draggable.js',
    //TOOLS DATATABLES
    '/scripts/dataTables_tableTools.js',
    '/plugins/fuelux/js/spinner.min.js',
    '/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js',
    '/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js',
    '/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js'
);


echo $this->Html->script($scripts);
