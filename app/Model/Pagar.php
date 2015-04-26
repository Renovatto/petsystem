<?php

class Pagar extends AppModel {

    public $useTable = 'contas_pagar';
    //public $order = array('contas_pagar.descricao' => 'ASC');
    public $cacheQueries = true;
    //Relacionamentos - Join
    public $belongsTo = array('categoria_financeiro' => array(
                                  'className' => 'categoria_financeiro',
                                  'conditions' => array('categoria_financeiro.ativo' => '1'),
                                  'fields' => 'id,descricao'),
                              'banco' => array(
                                  'className' => 'banco',
                                  'conditions' => array('banco.ativo' => '1'),
                                  'fields' => 'id,descricao'),
                              'fornecedor' => array(
                                  'className' => 'fornecedor',
                                  'conditions' => array('fornecedor.ativo' => '1'),
                                  'fields' => 'id,nome'));
    //public $belongsTo = array('Cliente', 'Especie', 'Raca');
    public $actsAs = array('CakePtbr.AjusteData','CakePtbr.AjusteFloat');

}
