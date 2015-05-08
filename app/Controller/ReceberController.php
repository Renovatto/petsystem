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
                return $this->redirect(array('action' => 'listar'));
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
                return $this->redirect(array('action' => 'listar'));
            } else {
                $this->Session->setFlash('Não foi possivel atualizar os dados', 'alert_error');
            }
        } else {
            $this->request->data = $this->Receber->read();
        }
    }

    public function index() {

    }

    public function listar($filtros = null) {
        //mktime(hora, min., seg., mês, dia, ano);
        $data_atual = date('Y-m-d'); //data atual
        $data_final = date('Y-m-d', mktime(0, 0, 0, date('m'), date('d') + 30, date('Y'))); //proximo mes        

        switch ($filtros) {
            case 'all':
                $params['conditions'] = array('Receber.ativo' => 1);
                break;
            case 'hoje':
                $params['conditions'] = array('Receber.ativo' => 1, 'Receber.recebido' => 0, 'Receber.data_vencimento =' => $data_atual);
                break;
            case 'pendentes':
                $params['conditions'] = array('Receber.ativo' => 1, 'Receber.recebido' => 0, 'Receber.data_vencimento >' => $data_atual);
                break;
            case 'atrasados':
                $params['conditions'] = array('Receber.ativo' => 1, 'Receber.recebido' => 0, 'Receber.data_vencimento <' => $data_atual);
                break;
            case 'recebidos':
                $params['conditions'] = array('Receber.ativo' => 1, 'Receber.recebido' => 1);
                $params['order'] = array('Receber.data_recebimento' => 'DESC');
                break;
            default :
                $params = array('conditions' => array('Receber.ativo' => 1,'Receber.recebido' => 0));
                break;
        }
        
        
        $listcontasreceber = $this->Receber->find('all', $params);
        $this->set('listcontasreceber', $listcontasreceber);
        
        /*echo "<pre>";
        print_r($filtros);
        echo "</pre>";*/        
    }    

}
