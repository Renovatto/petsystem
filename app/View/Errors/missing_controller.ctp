<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                ERRO <small>Não foi possivel encontrar o módulo solicitado</small>
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <?php echo $this->html->link('Home', '/'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <i class="icon-warning-sign"></i>
                    <?php echo $this->html->link('Erro 404', 'javascript:;'); ?>
                    <i class="icon-angle-right"></i>
                </li>

            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>

    <div class="row" >
        <div class="col-md-12 page-404">
            <div class="number">
                404
            </div>
            <div class="details">
                <h3>Oops!  You're lost.</h3>
                <p>
                    Controle solicitado não foi encontrado<br />
                    <a href="<?php echo $this->Html->url(array('controller' => '/')) ?>">
                        Retorne para o início
                    </a>
                </p>
            </div>
            <br>
            <br>
            <br>
            <br>
            <h3><?php echo $name; ?></h3>

            <strong><?php echo __d('cake', 'Error'); ?>: </strong>
            <?php echo __d('cake', 'An Internal Error Has Occurred.'); ?>

            <?php
            if (Configure::read('debug') > 0):
                echo $this->element('exception_stack_trace');
            endif;
            ?>

            <br>
            <br>

            <div class="details">
                <?php
                echo $this->element('sql_dump');
                ?>
            </div>



        </div>
    </div>
</div>
</div>

