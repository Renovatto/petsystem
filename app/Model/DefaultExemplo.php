<?php

class DefaultExemplo extends AppModel {

    public $useTable = 'default';
    public $order = array('descricao' => 'ASC');
    public $cacheQueries = true;

    #public $actsAs = array('CakePtbr.AjusteData', 'created'); // Primeiro caso
}
