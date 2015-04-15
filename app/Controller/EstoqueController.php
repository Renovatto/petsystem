<?php

class EstoqueController extends AppController {

    public function index() {

        $this->loadModel('Produto');
        $produtos = $this->Produto->find('list', array('fields' => 'id,descricao'));
        $this->set('listProdutos', $produtos);
    }

    public function novo() {
        if ($this->request->isPost()) {
            $data = $this->request->data;

            //Andre Renovato - 10/05/2014
            //Validando saida de estoque e negativando valor.
            if ($data['Estoque']['tipomovimento'] == 'S' && $data['Estoque']['valormovimento'] > 0) {
                $data['Estoque']['valormovimento'] = $data['Estoque']['valormovimento'] * -1;
            }

            $this->Estoque->create();
            if ($this->Estoque->save($data)) {
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'index'));
            }
            $this->Session->setFlash('', 'alert_warning');
        }
    }

    public function editar() {

    }

    public function listar() {

    }

    public function delete() {

    }

}
