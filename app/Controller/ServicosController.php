<?php

App::uses('AppController', 'Controller');

/**
 * Servicos Controller
 *
 * @property Servico $Servico
 * @property PaginatorComponent $Paginator
 */
class ServicosController extends AppController {

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Paginator');
    public $helpers = array('Js', 'CakePtbr.Formatacao');

    /**
     * index method
     *
     * @return void
     */
    public function index() {
        $this->Servico->recursive = 0;
        $this->set('servicos', $this->Paginator->paginate());
    }

    public function listar() {
        $params = array(
            'conditions' => array(
                'Servico.ativo' => 1
            ),
            'order' => array('Servico.descricao')
        );

        $listservicos = $this->Servico->find('all', $params);

        $this->set('listservicos', $listservicos);
    }

    /**
     * view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function view($id = null) {
        if (!$this->Servico->exists($id)) {
            throw new NotFoundException(__('Invalid servico'));
        }
        $options = array('conditions' => array('Servico.' . $this->Servico->primaryKey => $id));
        $this->set('servico', $this->Servico->find('first', $options));
    }

    /**
     * add method
     *
     * @return void
     */
    public function add() {
        if ($this->request->is('post')) {
            $this->Servico->create();
            if ($this->Servico->save($this->request->data)) {
                $this->Session->setFlash(__('The servico has been saved.'));
                return $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The servico could not be saved. Please, try again.'));
            }
        }
    }

    public function novo($id = null) {
        if ($this->request->isPost()) {
            $this->Servico->create();
            if ($this->Servico->save($this->request->data)) {
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'listar'));
            }
            $this->Session->setFlash('', 'alert_warning');
        }
    }

    /**
     * edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function editar($id) {
        if (!$this->Servico->exists($id)) {
            //throw new NotFoundException(__('Invalid servico'));
            $this->Session->setFlash(__('Serviço não encontrado'), 'warning_error');
            return $this->redirect(array('action' => 'listar'));
        }

        $this->Servico->id = $id;
        if ($this->request->isPost()) {
            if ($this->Servico->save($this->request->data)) {
                // Salvo com sucesso
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'listar'));
            } else {
                $this->Session->setFlash('', 'alert_error');
            }
        } else {
            $this->request->data = $this->Servico->read();
            //$this->request->data = $pet;
        }
    }

    /**
     * delete method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function delete($id = null) {
        $this->Servico->id = $id;
        if (!$this->Servico->exists()) {
            throw new NotFoundException(__('Invalid servico'));
        }
        $this->request->onlyAllow('post', 'delete');
        if ($this->Servico->delete()) {
            $this->Session->setFlash(__('O serviço foi excluído com sucesso!'));
        } else {
            $this->Session->setFlash(__('The servico could not be deleted. Please, try again.'));
        }
        return $this->redirect(array('action' => 'listar'));
    }

}
