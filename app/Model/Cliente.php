<?php

class Cliente extends AppModel {

    public $useTable = 'clientes';
    public $order = array('nome' => 'ASC');
    public $cacheQueries = true;
    //Relacionamentos
    public $hasMany = array('Pet'); //Cliente contem muitos pets

}
