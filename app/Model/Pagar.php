<?php

class Pagar extends AppModel {

    public $useTable = 'contas_pagar';
    //public $order = array('contas_pagar.descricao' => 'ASC');
    public $cacheQueries = true;
    //Relacionamentos - Join
    //public $hasOne = array('categoria_financeiro');
	/*public $hasOne = array(
        'categoria_financeiro' => array(
            'className' => 'categoria_financeiro',
            'conditions' => array('categoria_financeiro.ativo' => '1'),
            'fields' => 'descricao'
        )
    );*/
    //public $belongsTo = array('Cliente', 'Especie', 'Raca');
    public $actsAs = array('CakePtbr.AjusteData','CakePtbr.AjusteFloat');

}
