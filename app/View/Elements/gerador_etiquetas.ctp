
<div id="etiqueta" class="modal fade" tabindex="-1" data-width="800">
    <div class="modal-dialog modal-wide ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">Gerador de Etiquetas</h4>
            </div>
            <div class="modal-body">

                <div class="row">
                    <div class="col-md-12">
                        <form class="">
                            <div class="form-group">
                                <?php echo $this->Form->input('nome', array('class' => 'form-control col-md-6')); ?>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Etiqueta</label>
                                <?php echo $this->Form->textarea('etiqueta', array('class' => 'wysihtml5 form-control', 'placeholder' => 'descricao da etiqueta')); ?>
                            </div>

                            
                            <div class="form-group col-md-6">                                    
                                <label class="control-label">Modelo Pimaco</label>
                                <?php
                                $options = array('SP' => 'São Paulo', 'RJ' => 'Rio de Janeiro');
                                echo $this->Form->select('modelo_pimaco', $options, array('escape' => true, 'class' => 'form-control input-sm select2me'));
                                    ?>
                            </div>

                            <div class="form-group col-md-6">                                    
                                <label class="control-label">Tipo Papel</label>
                                <?php
                                $options = array('A4' => 'A4', 'CA' => 'CARTA');
                                echo $this->Form->select('modelo_pimaco', $options, array('escape' => true, 'class' => 'form-control input-sm select2me'));
                                    ?>
                            </div>                            
                          
                       </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn">Close</button>
                <button type="button" class="btn red">Ok</button>
            </div>
        </div>
    </div>
</div>

