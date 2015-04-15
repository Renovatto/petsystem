<?php

class Produto extends AppModel {

    public $useTable = 'produtos';
    public $order = array('descricao' => 'ASC');
    public $cacheQueries = true;
    public $actsAs = array('CakePtbr.AjusteFloat');

}
