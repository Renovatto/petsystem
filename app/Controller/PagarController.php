<?php

class PagarController extends AppController {
    /***********************************
     * @author Andre Renovato
     * @since Version 1.0 - 12/04/2015
     ***********************************/
    public $uses = array('Pagar');
    public $helpers = array('CakePtbr.Formatacao');


    public function index() {

    }

    public function icons() {
 		return $this->redirect(array('action' => 'index'));
    }

    public function novo() {
        if ($this->request->isPost()) {
        	echo "<pre>";
        	print_r($_POST);
        	echo "</pre>";
        	die;
            $this->Pagar->create(); //gera um novo id para tabela cliente
            if ($this->Pagar->save($this->request->data)) {
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'index'));
            }
            $this->Session->setFlash('', 'alert_warning');
        }
    }

    public function listar() {
        $params = array(
            'conditions' => array(
                'Pagar.ativo' => 1
            ),
            'order' => array('Pagar.descricao')
        );


        //$listcontaspagar = $this->Pagar->find('all', $params);
        $listcontaspagar = $this->Pagar->find('all');
        $this->set('listcontaspagar', $listcontaspagar);
    }    

}
