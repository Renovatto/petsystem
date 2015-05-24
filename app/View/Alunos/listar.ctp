<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Lista de Alunos <small>todos os alunos ativos são exibidos</small>
            </h3>
            <ul class="page-breadcrumb breadcrumb">
               <li class="btn-group">
                   <button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown" data-hover="" data-delay="1000" data-close-others="true">
                   <span>Filtros</span> <i class="icon-angle-down"></i>
                   </button>
                   <ul class="dropdown-menu pull-right" role="menu">  
                      <li><?php echo $this->Html->link('Hoje','/pagar/listar/hoje'); ?></li>
                      <li><?php echo $this->Html->link('Pendentes','/pagar/listar/pendentes'); ?></li>
                      <li><?php echo $this->Html->link('Atrasados','/pagar/listar/atrasados'); ?></li>
                      <li><?php echo $this->Html->link('Pagos','/pagar/listar/recebidos'); ?></li>
                      <li><?php echo $this->Html->link('Todos','/pagar/listar/all'); ?></li>
                      <li class="divider"></li>
                      <li><?php echo $this->Html->link('Limpar Filtros','/pagar/listar'); ?></li>
                   </ul>
                </li>                  
                <li>
                    <i class="icon-home"></i>
                    <?php echo $this->html->link('Home', '/'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <i class="icon-group"></i>
                    <?php echo $this->html->link('Cadastros', 'javascript:;'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <i class=""></i>
                    <?php echo $this->html->link('Alunos', '/clientes/listar'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <i class=""></i>
                    <?php echo $this->html->link('Listar', 'javascript:;'); ?>
                </li>

            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>

    <?php echo $this->Session->flash(); ?>

    <div class="row">
    <div class="col-md-12">
        <!-- BEGIN EXAMPLE TABLE PORTLET-->
        <div class="portlet box yellow">
            <div class="portlet-title">
                <div class="caption"><i class="icon-upload-alt"></i>Todos os Alunos</div>
                <div class="tools">
                    <a href="javascript:;" class="collapse"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="btn-group">
                        <a href="<?php echo $this->Html->url('novo'); ?>">
                            <button id="sample_editable_1_new" class="btn yellow">
                                Novo Aluno &nbsp;<i class="icon-plus"></i>
                            </button>
                        </a>
                    </div>
                    <div class="btn-group pull-right">
                        <button class="btn dropdown-toggle" data-toggle="dropdown"><i class="icon-cogs"></i>  Opções <i class="icon-angle-down"></i>
                        </button>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="#"><i class="icon-trash"></i> Excluir Seleção</a></li>
                            <li><a href="#"><i class="icon-print"></i>  Exportar Excel</a></li>
                        </ul>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover" id="tableDefault">
                    <thead>
                        <tr>
                            <th class="table-checkbox"><input type="checkbox" class="group-checkable" data-set="#tableDefault .checkboxes" /></th>
                            <th>Matricula</th>                            
                            <th>Nome</th> 
                            <th>Telefone</th>                           
                            <th>E-mail</th>                           
                            <th>Cadastro</th>
                            <th style="text-align:center">Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if ($listcontaspagar && count($listcontaspagar) > 0) {
                            //echo "<pre>";
                            //print_r($listcontaspagar);

                            $dataAtual = date('Y-m-d');
                            foreach ($listcontaspagar as $key => $model) {
                                $dadosPagamento = $model['Pagar'];
                                $nome_categoria = $model['categoria_financeiro']['descricao'];
                                $banco = $model['banco']['descricao'];
                                ?>
                                <tr class="odd gradeX">
                                    <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                    <td ><?php echo $this->Formatacao->data($dadosPagamento['data_vencimento']) ?></td>
                                    <td ><?php echo $dadosPagamento['descricao'] ?></td>
                                    <td ><?php echo $nome_categoria ?></td>
                                    <td ><?php echo $banco ?></td>
                                    <td class="center"><?php echo $this->Formatacao->moeda($dadosPagamento['valor']) ?></td>                                
                                    <td style="text-align:center">
                                        <?php
                                        if ($dadosPagamento['pago']) {                                            
                                            echo "<span class ='label label-sm label-success'>&nbsp;&nbsp;&nbsp;Pago&nbsp;&nbsp;&nbsp;</span></td>";
                                        } else {                                            
                                            if(strtotime($dataAtual) == strtotime($dadosPagamento['data_vencimento'])){
                                                echo "<span class ='label label-sm label-info'>&nbsp;&nbsp;&nbsp;Hoje&nbsp;&nbsp;&nbsp;</span></td>";
                                            }elseif(strtotime($dataAtual) > strtotime($dadosPagamento['data_vencimento'])){
                                                echo "<span class ='label label-sm label-danger'>Atrasado</span></td>";
                                            }else{                                            
                                                echo "<span class ='label label-sm label-warning'>Pendente</span></td>";
                                            }
                                        }
                                        ?>
                                    </td>
                                    <td class="center">
                                        <a class="edit" href="<?php echo $this->Html->url('editar/' . $dadosPagamento['id']); ?>"><i class="icon-edit"></i></a>
                                            <?php
                                            echo $this->Form->postLink('', array('action' => 'delete', $dadosPagamento['id']), array('class' => 'icon-trash', 'confirm' => 'Este registros será excluído permanentemente, deseja continuar?'));
                                            ?>
                                    </td>
                                </tr>

                                <?php
                            }
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>
    <!-- END EXAMPLE TABLE PORTLET-->

    <!-- MODAL ETIQUETA -->
    <?php echo $this->element('gerador_etiquetas'); ?>

</div>


<script>
    $(document).ready(function() {
        TableDefault.init();
        FormComponents.init();
    });
</script>