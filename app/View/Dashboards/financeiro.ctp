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
                <?php echo __('Minhas Contas') ?> <small>resumo de todas as suas contas em um só lugar</small>
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
                  <li class="pull-right">
                     <div id="dashboard-report-range" class="dashboard-date-range tooltips" data-placement="top" data-original-title="Alterar range data">
                        <i class="icon-calendar"></i>
                        <span></span>
                        <i class="icon-angle-down"></i>
                     </div>
                  </li>
            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
           <div class="dashboard-stat yellow">
              <div class="visual">
                 <i class="icon-upload-alt"></i>
              </div>
              <div class="details">
                 <div class="number">
                    <?php echo $this->Formatacao->moeda($total_pagar) ?>
                 </div>
                 <div class="desc">                           
                    Pagamentos de Hoje
                    <!--<span class="badge badge-important">2</span>-->
                 </div>
              </div>
              <a class="more" href="#">
              Detalhes <i class="m-icon-swapright m-icon-white"></i>
              </a>                 
           </div>           
        </div>        
        <div class="col-md-4">
           <div class="dashboard-stat green">
              <div class="visual">
                 <i class="icon-download-alt"></i>
              </div>
              <div class="details">
                 <div class="number">
                  <?php echo $this->Formatacao->moeda($total_receber) ?>
                 </div>
                 <div class="desc">Recebimentos de Hoje</div>

              </div>
              <a class="more" href="#">
              Detalhes<i class="m-icon-swapright m-icon-white"></i>
              </a>                               
           </div>
        </div>      
        <div class="col-md-4">
           <div class="dashboard-stat red">
              <div class="visual">
                 <i class="icon-money"></i>
              </div>
              <div class="details">
                 <div class="number"><?php echo $this->Formatacao->moeda($total_atraso) ?></div>
                 <div class="desc">Pagamentos em atraso</div>
              </div>
              <a class="more" href="#">
              Detalhes <i class="m-icon-swapright m-icon-white"></i>
              </a>                 
           </div>
        </div>        
     </div>

      <div class="row">
        <div class="col-md-6">
           <!-- BEGIN CONDENSED TABLE PORTLET-->
           <div class="portlet">
              <div class="portlet-title">
                  <div class="caption"><i class="icon-upload-alt"></i>Contas a Pagar</div>
                  <div class="actions">
                    <a class="btn default " href="#"> <i class="icon-share icon-black"></i></a>
                  </div>                 
              </div>
              <div class="portlet-body">
                 <div class="table-responsive">
                    <table class="table table-striped table-condensed table-hover">
                      <thead>
                         <tr>
                            <th>Vencimento</th>
                            <th>Descrição</th>
                            <th>Valor</th>
                         </tr>
                      </thead>
                      <tbody>
                         <tr>
                            <td>12/03/2015</td>
                            <td>Mussum ipsum cacilds</td>
                            <td>Otto</td>
                         </tr>
                         <tr>
                            <td>12/03/2015</td>
                            <td>Paisis, filhis, espiritis santis</td>
                            <td>Nilson</td>
                         </tr>
                         <tr>
                            <td>14/03/2015</td>
                            <td>Mussum ipsum cacilds</td>
                            <td>Cooper</td>
                         </tr>
                         <tr>
                            <td>15/03/2015</td>
                            <td>Interessantiss quisso</td>
                            <td>Lim</td>
                         </tr>                       
                         <tr>
                            <td>18/03/2015</td>
                            <td>Interessantiss quisso</td>
                            <td>Lim</td>
                         </tr>                       
                         <tr>
                            <td>19/03/2015</td>
                            <td>Carol</td>
                            <td>Lim</td>
                         </tr>

                      </tbody>
                    </table>
                    <hr>
                    <label style="text-align:right;display: block;"><h4>Total nos próximos 30 dias</h4></label>
                    <label style="text-align:right;display: block;">
                      <h4><p class="text-danger"><strong><?php echo $this->Formatacao->moeda($total_pagar) ?></strong></p></h4>
                    </label>

                 </div>
              </div>
           </div>
           <!-- END CONDENSED TABLE PORTLET-->
        </div>

        <div class="col-md-6">
           <!-- BEGIN CONDENSED TABLE PORTLET-->
           <div class="portlet">
              <div class="portlet-title">
                <div class="caption"><i class="icon-download-alt"></i>Contas a Receber</div>
                <div class="actions">
                  <a class="btn default " href="#"> <i class="icon-share icon-black"></i></a>
                </div>                    
              </div>             
              <div class="portlet-body">
                 <div class="table-responsive">
                    <table class="table table-striped table-condensed table-hover">
                      <thead>
                         <tr>
                            <th>Vencimento</th>
                            <th>Descrição</th>
                            <th>Valor</th>
                         </tr>
                      </thead>
                      <tbody>
                         <tr>
                            <td>12/03/2015</td>
                            <td>Mussum ipsum cacilds</td>
                            <td>Otto</td>
                         </tr>
                         <tr>
                            <td>12/03/2015</td>
                            <td>Paisis, filhis, espiritis santis</td>
                            <td>Nilson</td>
                         </tr>
                         <tr>
                            <td>14/03/2015</td>
                            <td>Mussum ipsum cacilds</td>
                            <td>Cooper</td>
                         </tr>
                         <tr>
                            <td>15/03/2015</td>
                            <td>Interessantiss quisso</td>
                            <td>Lim</td>
                         </tr>                       
                         <tr>
                            <td>18/03/2015</td>
                            <td>Interessantiss quisso</td>
                            <td>Lim</td>
                         </tr>                       
                         <tr>
                            <td>19/03/2015</td>
                            <td>Carol</td>
                            <td>Lim</td>
                         </tr>

                      </tbody>
                    </table>
                    <hr>
                    <label style="text-align:right;display: block;"><h4>Total nos próximos 30 dias</h4></label>
                    <label style="text-align:right;display: block;">
                      <h4><p class="text-success"><strong><?php echo $this->Formatacao->moeda($total_receber) ?></strong></p></h4>
                    </label>

                 </div>
              </div>
           </div>
           <!-- END CONDENSED TABLE PORTLET-->
        </div>
     </div>     

</div>

<script>
    jQuery(document).ready(function() {
        FormComponents.init();
        FormSamples.init();
    });
</script>