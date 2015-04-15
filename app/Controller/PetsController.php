<?php

class PetsController extends AppController {

    public $uses = array('Pet');
    public $helpers = array('Js', 'CakePtbr.Formatacao');

    private function setAlerts() {
        $this->Session->setFlash('Novo registro incluído. ', 'alert_success', array(), 'success');
        $this->Session->setFlash('Registro não encontrado.', 'alert_warning', array(), 'warning');
        $this->Session->setFlash('Não foi possivel processar a atualização.', 'alert_error', array(), 'erro');
        $this->Session->setFlash('Sucesso.', 'alert_info', array(), 'info');
    }

    private function setListas() {
        $this->loadModel('Cliente');
        $clientes = $this->Cliente->find('list', array('fields' => 'id,nome'));
        $this->set('listClientes', $clientes);

        $this->loadModel('Raca');
        $racas = $this->Raca->find('list', array('fields' => 'id,descricao'));
        $this->set('listRacas', $racas);

        $this->loadModel('Especie');
        $especies = $this->Especie->find('list', array('fields' => 'id,descricao'));
        $this->set('listEspecies', $especies);
    }

    public function icons() {

    }

    public function novo($id = null) {
        //setando dados dos campos selects
        $this->setListas();

        if ($this->request->isPost()) {
            $this->Pet->create();
            if ($this->Pet->save($this->request->data)) {
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'listar'));
            }
            $this->Session->setFlash('', 'alert_warning');
        }
    }

    public function editar($id) {
        //setando dados dos campos selects
        $this->setListas();

        $pet = $this->Pet->findById($id);
        if (!$pet) {
            $this->Session->setFlash(__('Pet não encontrado'), 'warning_error');
            return $this->redirect(array('action' => 'listar'));
        }

        $this->Pet->id = $id;
        if ($this->request->isPost()) {
            if ($this->Pet->save($this->request->data)) {
                // Salvo com sucesso
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'listar'));
            } else {
                $this->Session->setFlash('', 'alert_error');
            }
        } else {
            $this->request->data = $this->Pet->read();
            //$this->request->data = $pet;
        }
    }

    public function delete($id) {
        if ($this->Pet->delete($id)) {
            $this->Session->setFlash(__('O pet foi excluído com sucesso!'));
            $this->redirect(array('action' => 'listar'));
        }
    }

    public function listar() {
        $params = array(
            'conditions' => array(
                'Pet.ativo' => 1
            ),
            'order' => array('Pet.nome', 'Pet.apelido')
        );

        $listpets = $this->Pet->find('all');

        $this->set('listpets', $listpets);
    }

    public function index() {
        $params = array(
            'conditions' => array(
                'Pet.ativo' => 1
            ),
            'order' => array('Pet.nome', 'Pet.apelido')
        );

        $listpets = $this->Pet->find('all');
        $this->set('listpets', $listpets);
    }
    

}
