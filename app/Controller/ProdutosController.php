<?php

class ProdutosController extends AppController {

    public $uses = array('Produto');
    public $helpers = array('CakePtbr.Formatacao');

    public function index() {

    }

    public function novo() {
        if ($this->request->isPost()) {
            $this->Produto->create();
            if ($this->Produto->save($this->request->data)) {
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'listar'));
            }
            $this->Session->setFlash('', 'alert_warning');
        }
    }

    public function editar($id) {
        $produto = $this->Produto->findById($id);
        if (!$produto) {
            $this->Session->setFlash(__('Produto não encontrado'), 'warning_error');
            return $this->redirect(array('action' => 'listar'));
        }

        $this->Produto->id = $id;
        if ($this->request->isPost()) {
            if ($this->Produto->save($this->request->data)) {
                // Salvo com sucesso
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'listar'));
            } else {
                $this->Session->setFlash('', 'alert_error');
            }
        } else {
            $this->request->data = $this->Produto->read();
            //$this->request->data = $produto;
        }
    }

    public function listar() {
        $this->loadModel('Estoque');
        $params = array(
            'conditions' => array('Produto.ativo' => 1),
            'order' => array('Produto.descricao'));

        $listprodutos = $this->Produto->find('all', $params);

        if (is_array($listprodutos) && count($listprodutos) > 0) {
            $this->Estoque->virtualFields['estoqueatual'] = 0;
            foreach ($listprodutos as $key => $produto) {
                $produto_id = $produto['Produto']['id'];

                $sql = "SELECT SUM(VALORMOVIMENTO) as estoque__estoqueatual FROM estoque WHERE produto_id = $produto_id";
                $estoqueatual = $this->Estoque->query($sql);

                $estoqueatual = !empty($estoqueatual[0]['estoque']['estoqueatual']) ? $estoqueatual[0]['estoque']['estoqueatual'] : 0;

                $listprodutos[$key]['Produto']['estoqueatual'] = $estoqueatual;
            }
        }

        $this->set('listprodutos', $listprodutos);
    }

    public function delete() {
        if ($this->Produto->delete($id)) {
            $this->Session->setFlash(__('O produto foi excluído com sucesso!'));
        }
    }

    public function getEstoqueAtual($id) {
        $this->loadModel('Cliente');
        $clientes = $this->Cliente->find('list', array('fields' => 'id,nome'));
        $this->set('listClientes', $clientes);


        $produto = $this->Produto->findById($id);



        if (!$produto) {
            $this->Session->setFlash(__('Produto não encontrado'), 'warning_error');
            return $this->redirect(array('action' => 'listar'));
        }
    }

}
