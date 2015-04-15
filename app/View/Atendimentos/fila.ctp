<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Gerenciamento Filas de Atendimento <small>informe todos os detalhes</small>
            </h3>
        </div>
    </div>

    <hr>
    <div class="row">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <div class="btn-group">
            <p>
                <a href="<?php echo $this->Html->url('novo'); ?>">
                    <button id="sample_editable_1_new" class="btn green">
                        Novo Atendimeto &nbsp;<i class="icon-plus"></i>
                    </button>
                </a>
            </p>
        </div>

        <br />

        <div class="col-md-12" id="sortable_portlets">
            <div class="col-md-4">
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption"><i class="icon-briefcase"></i> Clínica</div>
                        <div class="tools">
                            <a href="javascript:;" class="collapse"></a>
                            <a href="javascript:;" class="reload"></a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-advance table-hover">
                                <thead></thead>
                                <tbody>
                                    <tr>
                                        <td class="highlight">
                                            <div class="row col-md-12">
                                                <div class="column sortable">
                                                    <div id="fila_clinica" class="portlet-body">
                                                        <?php
                                                        if (is_array($listFila) && count($listFila) > 0) {
                                                            foreach ($listFila as $key => $fila) {
                                                                ?>

                                                                <div class="portletMove portlet-title">
                                                                    <div class="card <?php echo $fila['card_color'] ?>">
                                                                        <?php
                                                                        //card-info
                                                                        //card-success == prioridade_baixa
                                                                        //card-warning == prioridade_media
                                                                        //card-danger  == prioridade_alta
                                                                        ?>

                                                                                                                        <!-- <p>Posição Fila: 0001</p>-->
                                                                        <strong><?php echo $fila['cliente_nome'] ?></strong>
                                                                        <p> <?php echo $fila['atendimento_tipo'] ?> </p>

                                                                        <div class="card-pet">
                                                                            <i class="icon-twitter"></i><strong> <?php echo $fila['pet_nome'] ?></strong>
                                                                            <br />
                                                                            <i class="icon-gift"></i><strong> <?php echo $this->Formatacao->tempo($fila['pet_nascimento']) ?> </strong>
                                                                        </div>
                                                                        <div id="card-foto">
                                                                            <p><?php echo $this->Html->image('/img/pets/dog3.jpg', array('class' => 'avatar img-responsive pull-right', 'alt' => 'CakePHP')); ?></p>
                                                                            <p>
                                                                                <i class="icon-calendar" title="<?php echo __('Horário Marcado') ?>"></i> <?php echo $fila['datahora_agenda'] ? $this->Formatacao->hora($fila['datahora_agenda']) : 'N/A' ?>
                                                                                <br />
                                                                                <i class="icon-time" title="<?php echo __('Horário de Chegada') ?>"></i> <?php echo $this->Formatacao->hora($fila['datahora_chegada']) ?>
                                                                            </p>
                                                                        </div>

                                                                    </div>
                                                                </div>

                                                                <?php
                                                            }
                                                        }
                                                        ?>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption"><i class="icon-briefcase"></i> Banho e Tosa </div>
                        <div class="tools">
                            <a href="javascript:;" class="collapse"></a>
                            <a href="javascript:;" class="reload"></a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-advance table-hover">
                                <thead></thead>
                                <tbody>
                                    <tr>
                                        <td class="highlight">
                                            <div class="row col-md-12">
                                                <div class="column sortable">
                                                    <div id="fila_banho_tosa" class="portlet-body">
                                                        <div class="portletMove portlet-title">
                                                            <div class="card card-danger">
                                                                <h4 class="block">Success! Some Header Goes Here</h4>
                                                                <p>
                                                                    Duis mollis, est non commodo luctus, nisi erat mattis consectetur purus sit amet
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="portletMove portlet-title">
                                                            <div class="card card-info">
                                                                <h4 class="block">Success! Some Header Goes Here</h4>
                                                                <p>
                                                                    Duis mollis, est non commodo luctus, nisi erat mattis consectetur purus sit amet
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="portlet">
                    <div class="portlet-title">
                        <div class="caption"><i class="icon-briefcase"></i> Concluídos </div>
                        <div class="tools">
                            <a href="javascript:;" class="collapse"></a>
                            <a href="javascript:;" class="reload"></a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-advance table-hover">
                                <thead></thead>
                                <tbody>
                                    <tr>
                                        <td class="highlight">
                                            <div class="row col-md-12">
                                                <div class="column sortable">
                                                    <div id="fila_concluidos" class="portlet-body">
                                                        <div class="portletMove portlet-title">
                                                            <div class="card card-success">
                                                                <h4 class="block">Success! Some Header Goes Here</h4>
                                                                <p>
                                                                    Duis mollis, est non commodo luctus, nisi erat mattis consectetur purus sit amet
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="portletMove portlet-title">
                                                            <div class="card card-info">
                                                                <h4 class="block">Success! Some Header Goes Here</h4>
                                                                <p>
                                                                    Duis mollis, est non commodo luctus, nisi erat mattis consectetur purus sit amet
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>


</div>


<script>
    jQuery(document).ready(function() {
        //fechando menu
        $("body").addClass('page-sidebar-closed');
        PortletDraggable.init();
    });
</script>