
<?php

/**
 * Controller
 *
 * @author Andre Renovato <andre.renovatto@uol.com.br>
 * @since Version 1.0 - 27/04/2014
 */
class FinanceiroController extends AppController {
    public $name = 'Financeiro';
    public $uses = array('Contas_pagar','Contas_receber');
    public $helpers = array('CakePtbr.Formatacao');

    public function index() {

    }

    public function pagar() {
        if ($this->request->isPost()) {
            //echo "<pre>";
            //print_r($_POST);
            //echo "</pre>";
            
            $this->Contas_pagar->create(); //gera um novo id para tabela contas a pagar
            if ($this->Contas_pagar->save($this->request->data)) {
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'index'));
            }
            $this->Session->setFlash('', 'alert_warning');
        }        
    }

    public function receber() {
        if ($this->request->isPost()) {
            $this->Contas_receber->create(); //gera um novo id para tabela financeiro
            if ($this->Contas_receber->save($this->request->data)) {
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'listar'));
            }
            $this->Session->setFlash('', 'alert_warning');
        }        
    }    

    public function receber_editar() {
        $receber = $this->Contas_receber->findById($id);

        if (!$receber) {
            $this->Session->setFlash(__('Cliente não encontrado'), 'warning_error');
            return $this->redirect(array('action' => 'listar'));
        }

        if (is_array($receber['Pet']) && count($receber['Pet']) > 0) {
            foreach ($receber['Pet'] as $key => $dadosPet) {
                if (!empty($dadosPet['raca_id']) && $dadosPet['raca_id'] > 0) {
                    $this->loadModel('Raca');
                    $desc_raca = $this->Raca->find('first', array('fields' => array('Raca.descricao'), 'conditions' => array('Raca.id' => $dadosPet['raca_id'])));

                    if (!empty($desc_raca['Raca']['descricao'])) {
                        $receber['Pet'][$key]['raca'] = $desc_raca['Raca']['descricao'];
                    }
                }
            }
        }

        //Debugger::log($receber);

        $this->Cliente->id = $id;
        if ($this->request->isPost()) {
            if ($this->Cliente->save($this->request->data)) {
                // Salvo com sucesso
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'listar'));
            } else {
                $this->Session->setFlash('', 'alert_error');
            }
        } else {
            //$this->request->data = $this->Cliente->read();
            $this->request->data = $cliente;
        }
    }

    public function pagar_editar() {
        $pagar = $this->Contas_pagar->findById($id);

        if (!$pagar) {
            $this->Session->setFlash(__('Cliente não encontrado'), 'warning_error');
            return $this->redirect(array('action' => 'listar'));
        }

        if (is_array($pagar['Pet']) && count($pagar['Pet']) > 0) {
            foreach ($pagar['Pet'] as $key => $dadosPet) {
                if (!empty($dadosPet['raca_id']) && $dadosPet['raca_id'] > 0) {
                    $this->loadModel('Raca');
                    $desc_raca = $this->Raca->find('first', array('fields' => array('Raca.descricao'), 'conditions' => array('Raca.id' => $dadosPet['raca_id'])));

                    if (!empty($desc_raca['Raca']['descricao'])) {
                        $pagar['Pet'][$key]['raca'] = $desc_raca['Raca']['descricao'];
                    }
                }
            }
        }

        //Debugger::log($cliente);

        $this->Contas_pagar->id = $id;
        if ($this->request->isPost()) {
            if ($this->Contas_pagar->save($this->request->data)) {
                // Salvo com sucesso
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'listar'));
            } else {
                $this->Session->setFlash('', 'alert_error');
            }
        } else {
            //$this->request->data = $this->Cliente->read();
            $this->request->data = $pagar;
        }
    }

    public function listar() {

    }

    public function delete() {

    }

}
