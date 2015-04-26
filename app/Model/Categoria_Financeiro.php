<?php

class Categoria_Financeiro extends AppModel {

    public $useTable = 'categoria_financeiro';
    public $order = array('descricao' => 'ASC');
    public $cacheQueries = true;

    #public $actsAs = array('CakePtbr.AjusteData', 'created'); // Primeiro caso
}
