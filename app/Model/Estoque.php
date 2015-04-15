<?php

class Estoque extends AppModel {

    public $useTable = 'estoque';
    public $order = array('datamovimento' => 'ASC');
    public $cacheQueries = true;

}
