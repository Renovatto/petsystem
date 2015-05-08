<?php

class Receber extends AppModel {

    public $useTable = 'contas_receber';
    public $order = array('Receber.data_vencimento' => 'DESC');
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
                          'cliente' => array(
                              'className' => 'cliente',
                              'conditions' => array('cliente.ativo' => '1'),
                              'fields' => 'id,nome'));

    public $actsAs = array('CakePtbr.AjusteData');

}
