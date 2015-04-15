<?php

class Raca extends AppModel {

    public $useTable = 'racas';
    public $order = array('descricao' => 'ASC');
    public $cacheQueries = true;

    #public $actsAs = array('CakePtbr.AjusteData', 'created'); // Primeiro caso
}
