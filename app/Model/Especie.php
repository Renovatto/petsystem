<?php

class Especie extends AppModel {

    public $useTable = 'especies';
    public $order = array('descricao' => 'ASC');
    public $cacheQueries = true;

    #public $actsAs = array('CakePtbr.AjusteData', 'created'); // Primeiro caso
}
