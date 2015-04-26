<?php
echo $this->Html->script(array('/js/renovasFuncs/maskMoney.js', '/js/renovasFuncs/custom-funcs.js'));
     
$action_buttons = "<button type='button' class='btn default'>";
$action_buttons .= $this->Html->link('Cancelar', array('controller' => 'Pagar', 'action' => 'index'),
                                    array('confirm' => __('Toda alteração será perdida, deseja continuar?')));
$action_buttons .= "</button>";
$action_buttons .= "<button type='submit' class='btn blue'><i class='icon-ok'></i> Salvar </button>";

?>
<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                <?php echo __('Minhas Constas') ?> <small>resumo de todas as suas contas em um só lugar</small>
            </h3>
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <?php echo $this->html->link('Home', '/'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <i class="icon-dollar"></i>
                    <?php echo $this->html->link('Financeiro', 'javascript:;'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <i class=""></i>
                    <?php echo $this->html->link('Dasboard Financeiro', '/pagar/dashboard'); ?>
                </li>

            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>

    <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
           <div class="dashboard-stat blue">
              <div class="visual">
                 <i class="icon-comments"></i>
              </div>
              <div class="details">
                 <div class="number">
                    R$ 2.376,60
                 </div>
                 <div class="desc">                           
                    Contas a Pagar
                 </div>
              </div>
              <a class="more" href="#">
              Detalhes <i class="m-icon-swapright m-icon-white"></i>
              </a>                 
           </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
           <div class="dashboard-stat green">
              <div class="visual">
                 <i class="icon-shopping-cart"></i>
              </div>
              <div class="details">
                 <div class="number">R$ 7.980,00</div>
                 <div class="desc">Contas a Receber</div>
              </div>
              <a class="more" href="#">
              Detalhes<i class="m-icon-swapright m-icon-white"></i>
              </a>                 
           </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
           <div class="dashboard-stat purple">
              <div class="visual">
                 <i class="icon-globe"></i>
              </div>
              <div class="details">
                 <div class="number">R$ 2.380,50</div>
                 <div class="desc">Saldo</div>
              </div>
              <a class="more" href="#">
              View more <i class="m-icon-swapright m-icon-white"></i>
              </a>                 
           </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
           <div class="dashboard-stat yellow">
              <div class="visual">
                 <i class="icon-bar-chart"></i>
              </div>
              <div class="details">
                 <div class="number">12,5M$</div>
                 <div class="desc">Total Profit</div>
              </div>
              <a class="more" href="#">
              View more <i class="m-icon-swapright m-icon-white"></i>
              </a>                 
           </div>
        </div>
     </div>

</div>

<script>
    jQuery(document).ready(function() {
        FormComponents.init();
        FormSamples.init();
    });
</script>