<?php

/**
 * Controller para tabelas auxiliares e itens que não estão gravados no banco de dados.
 *
 * @author Andre Renovato <andre.renovatto@uol.com.br>
 * @since Version 1.0 - 06/04/2014
 */
class AuxiliaresController extends AppController {

    public $uses = array('Auxiliar');

    public function tamanhoPets() {
        if ($this->request->isRequested()) {
            return array(
                'P' => __('Pequeno'),
                'M' => __('Médio'),
                'G' => __('Grande')
            );
        }
    }

    public function unidadeMedida() {
        if ($this->request->isRequested()) {
            return array(
                'U' => __('Unidade'),
                'M' => __('Metros'),
                'L' => __('Litros')
            );
        }
    }

    public function prioridadeAtendimento() {
        if ($this->request->isRequested()) {
            $params['conditions']['auxiliar'] = 'atendimento_prioridade';
            $params['fields'][] = 'codigo';
            $params['fields'][] = 'valor';

            $return = $this->Auxiliar->find('list', $params);

            return $return;
        }
    }

    public function tipoAtendimento() {
        if ($this->request->isRequested()) {
            $params['conditions']['auxiliar'] = 'atendimento_tipo';
            $params['fields'][] = 'codigo';
            $params['fields'][] = 'valor';

            $return = $this->Auxiliar->find('list', $params);

            return $return;
        }
    }

    public function pesoPets() {
        if ($this->request->isRequested()) {
            return array(
                //'' => __('- Selecione -'),
                '1' => __('Até 1kg'),
                '2' => __('Até 2kg'),
                '3' => __('Até 3kg'),
                '4' => __('Até 4kg'),
                '5' => __('Até 5kg'),
                '6' => __('Até 6kg'),
                '7' => __('Até 7kg'),
                '8' => __('Até 8kg'),
                '9' => __('Até 9kg'),
                '10' => __('Até 10kg'),
                '15' => __('Até 15kg'),
                '20' => __('Até 20kg'),
                '25' => __('Até 25kg'),
                '30' => __('Até 30kg'),
                '35' => __('Até 35kg'),
                '40' => __('Até 40kg'),
                '45' => __('Até 45kg'),
                '50' => __('Até 50kg')
            );
        }
    }

    public function categoriasFinanceiro(){
        if ($this->request->isRequested()) {
            $params['conditions']['auxiliar'] = 'financeiro_categoria';
            $params['fields'][] = 'codigo';
            $params['fields'][] = 'valor';

            $return = $this->Auxiliar->find('list', $params);

            return $return;
        }        
    }    


}
