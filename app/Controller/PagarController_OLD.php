<?php
class PagarController extends AppController {
    /***********************************
     * @author Andre Renovato
     * @since Version 1.0 - 12/04/2015
     ***********************************/
    public $uses = array('Pagar');
    public $helpers = array('CakePtbr.Formatacao');

    public function icons() {
 		return $this->redirect(array('action' => 'index'));
    }

   private function setListas() {
        $this->loadModel('Categoria_Financeiro');
        $categorias = $this->Categoria_Financeiro->find('list', array('fields' => 'id,descricao','conditions' => array('ativo' => '1')));
        $this->set('listCategorias', $categorias);        

        $this->loadModel('Banco');
        $bancos = $this->Banco->find('list', array('fields' => 'id,descricao','conditions' => array('ativo' => '1')));
        $this->set('listBancos', $bancos);

        $this->loadModel('Fornecedor');
        $fornecedores = $this->Fornecedor->find('list', array('fields' => 'id,nome','conditions' => array('ativo' => '1')));
        $this->set('listFornecedores', $fornecedores);
    }

    public function novo() {
       //setando dados dos campos selects
        $this->setListas();
        if ($this->request->isPost()) {
            /*echo "<pre>";
            print_r($_POST);
            echo "</pre>";*/
            //die;
            $this->Pagar->create(); //gera um novo id para tabela cliente
            if ($this->Pagar->save($this->request->data)) {
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'index'));
            }
            $this->Session->setFlash('', 'alert_warning');
        }
    }

    public function editar($id = null) {
       //setando dados dos campos selects
        $this->setListas();
        $pagamento = $this->Pagar->findById($id);

        if (!$pagamento) {
            $this->Session->setFlash(__('Pagamento não encontrado'), 'alert_error');
            return $this->redirect(array('action' => 'index'));
        }

        $this->Pagar->id = $id;

        if ($this->request->data) {    
            if ($this->Pagar->save($this->request->data)) {
                // Salvo com sucesso
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Não foi possivel atualizar os dados', 'alert_error');
            }
        } else {
            $this->request->data = $this->Pagar->read();
            //$this->request->data = $pagamento;
        }
    }

    public function dashboard() {

    }

    public function index() {
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
