<?php

class Atendimento extends AppModel {

    public $useTable = 'filas_atendimento';
    public $order = array('datahora_chegada' => 'DESC');
    public $cacheQueries = true;
    //Relacionamentos - Join
    public $belongsTo = array('Cliente', 'Pet'); //Um registro de um model pertence (é filho) de um registro de outro model (1:1)

    #public $actsAs = array('CakePtbr.AjusteData', 'created'); // Primeiro caso
}
