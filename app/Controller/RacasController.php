<?php

class RacasController extends AppController {

    public $uses = array('Racas');
    public $helpers = array('CakePtbr.Formatacao');

    public function listar() {
        $params = array(
            'order' => array('Racas.descricao')
        );

        $listracas = $this->Raca->find('all');
        $this->set('listracas', $listracas);
    }

}
