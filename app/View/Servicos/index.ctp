<div class="page-content">
    <!-- INICIO DO CONTEUDO DA PAGINA -->
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <h3 class="page-title">
                Default <small>informe todos os detalhes</small>
            </h3>
            <ul class="page-breadcrumb breadcrumb">
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
                    <?php echo $this->html->link('Clientes', '/clientes/listar'); ?>
                    <i class="icon-angle-right"></i>
                </li>
                <li><?php echo $this->html->link('Novo', 'javascript:;'); ?></li>

            </ul>
            <!-- END PAGE TITLE & BREADCRUMB-->
        </div>
    </div>

    <div class="servicos index">
        <h2><?php echo __('Servicos'); ?></h2>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th><?php echo $this->Paginator->sort('id'); ?></th>
                <th><?php echo $this->Paginator->sort('codinterno'); ?></th>
                <th><?php echo $this->Paginator->sort('descricao'); ?></th>
                <th><?php echo $this->Paginator->sort('valor_normal'); ?></th>
                <th><?php echo $this->Paginator->sort('valor_promocao'); ?></th>
                <th><?php echo $this->Paginator->sort('valor_promocao2'); ?></th>
                <th><?php echo $this->Paginator->sort('valor_promocao3'); ?></th>
                <th><?php echo $this->Paginator->sort('categoria_id'); ?></th>
                <th><?php echo $this->Paginator->sort('observacoes'); ?></th>
                <th><?php echo $this->Paginator->sort('user_id_modifiedd'); ?></th>
                <th><?php echo $this->Paginator->sort('modified'); ?></th>
                <th><?php echo $this->Paginator->sort('created'); ?></th>
                <th><?php echo $this->Paginator->sort('ativo'); ?></th>
                <th class="actions"><?php echo __('Actions'); ?></th>
            </tr>
            <?php foreach ($servicos as $servico): ?>
                <tr>
                    <td><?php echo h($servico['Servico']['id']); ?>&nbsp;</td>
                    <td><?php echo h($servico['Servico']['codinterno']); ?>&nbsp;</td>
                    <td><?php echo h($servico['Servico']['descricao']); ?>&nbsp;</td>
                    <td><?php echo h($servico['Servico']['valor_normal']); ?>&nbsp;</td>
                    <td><?php echo h($servico['Servico']['valor_promocao']); ?>&nbsp;</td>
                    <td><?php echo h($servico['Servico']['valor_promocao2']); ?>&nbsp;</td>
                    <td><?php echo h($servico['Servico']['valor_promocao3']); ?>&nbsp;</td>
                    <td><?php echo h($servico['Servico']['categoria_id']); ?>&nbsp;</td>
                    <td><?php echo h($servico['Servico']['observacoes']); ?>&nbsp;</td>
                    <td><?php echo h($servico['Servico']['user_id_modifiedd']); ?>&nbsp;</td>
                    <td><?php echo h($servico['Servico']['modified']); ?>&nbsp;</td>
                    <td><?php echo h($servico['Servico']['created']); ?>&nbsp;</td>
                    <td><?php echo h($servico['Servico']['ativo']); ?>&nbsp;</td>
                    <td class="actions">
                        <?php echo $this->Html->link(__('View'), array('action' => 'view', $servico['Servico']['id'])); ?>
                        <?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $servico['Servico']['id'])); ?>
                        <?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $servico['Servico']['id']), null, __('Are you sure you want to delete # %s?', $servico['Servico']['id'])); ?>
                    </td>
                </tr>
            <?php endforeach; ?>
        </table>
        <p>
            <?php
            echo $this->Paginator->counter(array(
                'format' => __('Page {:page} of {:pages}, showing {:current} records out of {:count} total, starting on record {:start}, ending on {:end}')
            ));
            ?>	</p>
        <div class="paging">
            <?php
            echo $this->Paginator->prev('< ' . __('previous'), array(), null, array('class' => 'prev disabled'));
            echo $this->Paginator->numbers(array('separator' => ''));
            echo $this->Paginator->next(__('next') . ' >', array(), null, array('class' => 'next disabled'));
            ?>
        </div>
    </div>
    <div class="actions">
        <h3><?php echo __('Actions'); ?></h3>
        <ul>
            <li><?php echo $this->Html->link(__('New Servico'), array('action' => 'add')); ?></li>
        </ul>
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