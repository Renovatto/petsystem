<?php

class Banco extends AppModel {

    public $useTable = 'Bancos';
    public $order = array('id');
    public $cacheQueries = true;

    #public $actsAs = array('CakePtbr.AjusteData', 'created'); // Primeiro caso
}
