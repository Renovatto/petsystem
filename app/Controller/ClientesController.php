<?php

class ClientesController extends AppController {

    public $uses = array('Cliente');
    public $helpers = array('CakePtbr.Formatacao');

    //public $name = 'Cliente';

    /**
     * Function que seta padrão de alertas para Controllers, todo controler deve ter esta function.
     * Esta function deve ser iniciada nas actions do controller para utilizar as mensagens
     *
     * @author Andre Renovato
     * @since Version 1.0 - 30/03/2014
     */
    private function setAlerts() {
        $this->Session->setFlash('Novo registro incluído. ', 'alert_success', array(), 'success');
        $this->Session->setFlash('Registro não encontrado.', 'alert_warning', array(), 'warning');
        $this->Session->setFlash('Não foi possivel processar a atualização.', 'alert_error', array(), 'erro');
        $this->Session->setFlash('Sucesso.', 'alert_info', array(), 'info');
    }

    public function icons() {
       
    }

    public function novo() {
        if ($this->request->isPost()) {
            $this->Cliente->create(); //gera um novo id para tabela cliente
            if ($this->Cliente->save($this->request->data)) {
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'listar'));
            }
            $this->Session->setFlash('', 'alert_warning');
        }
    }

    public function editar($id) {
        $cliente = $this->Cliente->findById($id);

        if (!$cliente) {
            $this->Session->setFlash(__('Cliente não encontrado'), 'warning_error');
            return $this->redirect(array('action' => 'listar'));
        }

        if (is_array($cliente['Pet']) && count($cliente['Pet']) > 0) {
            foreach ($cliente['Pet'] as $key => $dadosPet) {
                if (!empty($dadosPet['raca_id']) && $dadosPet['raca_id'] > 0) {
                    $this->loadModel('Raca');
                    $desc_raca = $this->Raca->find('first', array('fields' => array('Raca.descricao'), 'conditions' => array('Raca.id' => $dadosPet['raca_id'])));

                    if (!empty($desc_raca['Raca']['descricao'])) {
                        $cliente['Pet'][$key]['raca'] = $desc_raca['Raca']['descricao'];
                    }
                }
            }
        }

        //Debugger::log($cliente);

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

    public function delete($id) {
        if (!$this->request->is('get')) {
            throw new MethodNotAllowedException();
        }
        if ($this->Cliente->delete($id)) {
            $this->Session->setFlash(__('O cliente foi excluído com sucesso!'));
            $this->redirect(array('action' => 'listar'));
        }
    }

    public function listar() {
        // Carrega automaticamente a view:
        // /View/Clientes/listar.ctp
        $params = array(
            'conditions' => array(
                'Cliente.ativo' => 1
            ),
            'order' => array('Cliente.nome')
        );


        //$listclientes = $this->Cliente->find('all', $params);
        $listclientes = $this->Cliente->find('all');
        $this->set('listclientes', $listclientes);
    }

}
