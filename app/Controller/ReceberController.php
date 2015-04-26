<?php
class ReceberController extends AppController {
    /***********************************
     * @author Andre Renovato
     * @since Version 1.0 - 27/04/2015
     ***********************************/
    public $uses = array('Receber');
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

        $this->loadModel('Cliente');
        $clientes = $this->Cliente->find('list', array('fields' => 'id,nome','conditions' => array('ativo' => '1')));
        $this->set('listClientes', $clientes);
    }

    public function novo() {
       //setando dados dos campos selects
        $this->setListas();
        if ($this->request->isPost()) {
            /*echo "<pre>";
            print_r($_POST);
            echo "</pre>";*/
            //die;
            $this->Receber->create(); //gera um novo id para tabela cliente
            if ($this->Receber->save($this->request->data)) {
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'index'));
            }
            $this->Session->setFlash('', 'alert_warning');
        }
    }

    public function editar($id = null) {
       //setando dados dos campos selects
        $this->setListas();
        $pagamento = $this->Receber->findById($id);

        if (!$pagamento) {
            $this->Session->setFlash(__('Recebimento não encontrado'), 'alert_error');
            return $this->redirect(array('action' => 'index'));
        }

        $this->Receber->id = $id;

        if ($this->request->data) {    
            if ($this->Receber->save($this->request->data)) {
                // Salvo com sucesso
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Não foi possivel atualizar os dados', 'alert_error');
            }
        } else {
            $this->request->data = $this->Receber->read();
        }
    }

    public function dashboard() {

    }

    public function index() {
        $params = array(
            'conditions' => array(
                'Receber.ativo' => 1
            ),
            'order' => array('Receber.descricao')
        );


        //$listcontasreceber = $this->Receber->find('all', $params);
        $listcontasreceber = $this->Receber->find('all');
        $this->set('listcontasreceber', $listcontasreceber);
    }    

}
