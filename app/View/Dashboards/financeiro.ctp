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
<?php

//            echo "<pre>";
//            print_r($listcontasreceber);
//            echo "</pre>";    
//            

?>
    <div class="row">
        <div class="col-md-3">
            <div class="dashboard-stat yellow">
                <div class="visual">
                    <i class="icon-upload-alt"></i>
                </div>
                <div class="details">
                    <div class="number">
                    <?php echo $this->Formatacao->moeda($pagamento_dia) ?>
                    </div>
                    <div class="desc">
                        Pagamentos Hoje
                        <span class="badge badge-important" style="background:#551A8B"><?php echo $pcount_dia ?></span>
                    </div>
                </div>
<!--                <a class="more" href="pagar/listar/hoje">
                Detalhes<i class='m-icon-swapright m-icon-white'></i>
                </a>-->
                <?php echo $this->Html->link('Detalhes','/pagar/listar/hoje', array('class'=>'more')); ?>
            </div>
        </div>
        <div class="col-md-3">
            <div class="dashboard-stat red">
                <div class="visual">
                    <i class="icon-dollar"></i>
                </div>
                <div class="details">
                    <div class="number"><?php echo $this->Formatacao->moeda($pagamentos_atrasados) ?></div>
                    <div class="desc">
                        Pagamentos atraso
                        <span class="badge badge-info" style="background:#551A8B"><?php echo $pcount_atrasados ?></span>
                    </div>
                </div>
<!--                <a class="more" href="#">
                    Detalhes <i class="m-icon-swapright m-icon-white"></i>
                </a>-->
                <?php echo $this->Html->link('Detalhes','/pagar/listar/atrasados', array('class'=>'more')); ?>
            </div>
        </div>        
        <div class="col-md-3">
            <div class="dashboard-stat green">
                <div class="visual">
                    <i class="icon-download-alt"></i>
                </div>
                <div class="details">
                    <div class="number">
                  <?php echo $this->Formatacao->moeda($recebimento_dia) ?>
                    </div>
                    <div class="desc">
                        Recebimentos Hoje
                        <span class="badge badge-important" style="background:#551A8B"><?php echo $rcount_dia ?></span>
                    </div>

                </div>
<!--                <a class="more" href="#">
                    Detalhes<i class="m-icon-swapright m-icon-white"></i>
                </a>-->
                <?php echo $this->Html->link('Detalhes','/receber/listar/hoje', array('class'=>'more')); ?>
            </div>
        </div>

        <div class="col-md-3">
            <div class="dashboard-stat red">
                <div class="visual">
                    <i class="icon-dollar"></i>
                </div>
                <div class="details">
                    <div class="number"><?php echo $this->Formatacao->moeda($recebimentos_atrasados) ?></div>
                    <div class="desc">
                        Recebimentos atraso
                        <span class="badge badge-info" style="background:#551A8B"><?php echo $rcount_atrasados ?></span>
                    </div>
                </div>
<!--                <a class="more" href="#">
                    Detalhes <i class="m-icon-swapright m-icon-white"></i>
                </a>-->
                <?php echo $this->Html->link('Detalhes','/receber/listar/atrasados', array('class'=>'more')); ?>
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
                        <?php
                        $total_pagar_30 = 0;
                        if(is_array($listcontaspagar) && count($listcontaspagar) > 0){
                        ?>
                            <thead>
                                <tr>
                                    <th>Vencimento</th>
                                    <th>Descrição</th>
                                    <th>Valor</th>
                                </tr>
                            </thead>
                            <tbody>
                        <?php
                            foreach ($listcontaspagar as $key => $model) {
                                $dadosPagamento = $model['Pagar'];
                                $nome_categoria = $model['categoria_financeiro']['descricao'];
                                $banco = $model['banco']['descricao'];

                                $total_pagar_30 += $dadosPagamento['valor'];
                                ?>
                                <tr>
                                    <td ><?php echo $this->Formatacao->data($dadosPagamento['data_vencimento']) ?></td>
                                    <td ><i class="icon-paperclip"></i>
                                        <?php echo $dadosPagamento['descricao'].' - '.$nome_categoria ?></td>
                                    <td class="center"><?php echo $this->Formatacao->moeda($dadosPagamento['valor']) ?></td>
                                </tr>
                            <?php
                                }
                            }else{
                            ?>
                                <tr>
                                    <td> <h3><small><strong>Boas notícias</strong>,
                                                <br> não existem contas a pagar nos próximos dias.</small></h3>
                                    </td>
                                </tr>
                            <?php
                            }
                            ?>

                            </tbody>
                        </table>
                        <hr>
                        <label style="text-align:right;display: block;"><h4>Total nos próximos 30 dias</h4></label>
                        <label style="text-align:right;display: block;">
                            <h4><p class="text-danger"><strong><?php echo $this->Formatacao->moeda($total_pagar_30) ?></strong></p></h4>
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
                    <?php
                        $total_receber_30 = 0;//listcontasreceber
                        if(is_array($listcontasreceber) && count($listcontasreceber) > 0){
                        ?>
                            <thead>
                                <tr>
                                    <th>Vencimento</th>
                                    <th>Descrição</th>
                                    <th>Valor</th>
                                </tr>
                            </thead>
                            <tbody>
                        <?php
                            foreach ($listcontasreceber as $key => $model) {
                                $dadosRecebimento = $model['Receber'];
                                $nome_categoria = $model['categoria_financeiro']['descricao'];
                                $banco = $model['banco']['descricao'];

                                $total_receber_30 += $dadosRecebimento['valor'];
                                ?>
                                <tr>
                                    <td ><?php echo $this->Formatacao->data($dadosRecebimento['data_vencimento']) ?></td>
                                    <td ><i class="icon-paperclip"></i>
                                        <?php echo $dadosRecebimento['descricao'].' - '.$nome_categoria ?></td>
                                    <td class="center"><?php echo $this->Formatacao->moeda($dadosRecebimento['valor']) ?></td>
                                </tr>
                            <?php
                                }
                            }else{
                            ?>
                                <tr>
                                    <td> <h3><small><strong>Fique atento</strong>,
                                                <br> não existem contas a receber nos próximos dias.</small></h3>
                                    </td>
                                </tr>
                            <?php
                            }
                            ?>
                            

                            </tbody>
                        </table>
                        <hr>
                        <label style="text-align:right;display: block;"><h4>Total nos próximos 30 dias</h4></label>
                        <label style="text-align:right;display: block;">
                            <h4><p class="text-success"><strong><?php echo $this->Formatacao->moeda($total_receber_30) ?></strong></p></h4>
                        </label>

                    </div>
                </div>
            </div>
            <!-- END CONDENSED TABLE PORTLET-->
        </div>
    </div>

</div>

<script>
    jQuery(document).ready(function () {
        FormComponents.init();
        FormSamples.init();
    });
</script>