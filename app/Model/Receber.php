<?php

class Contas_receber extends AppModel {

    public $useTable = 'contas_receber';
    public $order = array('contas_receber.descricao' => 'ASC');
    public $cacheQueries = true;
    //Relacionamentos - Join
    //public $belongsTo = array('Cliente', 'Especie', 'Raca');
    public $actsAs = array('CakePtbr.AjusteData');

}
