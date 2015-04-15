<?php

class Pet extends AppModel {

    public $useTable = 'pets';
    public $order = array('Pet.nome' => 'ASC');
    public $cacheQueries = true;
    //Relacionamentos - Join
    public $belongsTo = array('Cliente', 'Especie', 'Raca');
    public $actsAs = array('CakePtbr.AjusteData');

}
