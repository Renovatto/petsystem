<?php

class Banco extends AppModel {

    public $useTable = 'bancos';
    public $order = array('id');
    public $cacheQueries = true;

    #public $actsAs = array('CakePtbr.AjusteData', 'created'); // Primeiro caso
}
