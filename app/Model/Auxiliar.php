<?php

class Auxiliar extends AppModel {

    public $useTable = 'tabelas_auxiliares';
    public $order = array('auxiliar' => 'ASC', 'codigo' => 'ASC');
    public $cacheQueries = true;

    #public $actsAs = array('CakePtbr.AjusteData', 'created'); // Primeiro caso
}
