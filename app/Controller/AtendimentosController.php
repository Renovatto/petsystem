<?php

/**
 * Controller para tabelas produtos
 *
 * @author Andre Renovato <andre.renovatto@uol.com.br>
 * @since Version 1.0 - 27/04/2014
 */
class AtendimentosController extends AppController {

    /**
     * O componente RequestHandler é usado para se obter informações adicionais sobre as
     * requisições HTTP feitas a sua aplicação CakePHP.
     * Por padrão o RequestHandler vai detectar automaticamente requisições Ajax com base
     * no cabeçalho HTTP-X-Requested-With que muitas das bibliotecas Javascript usam.
     * o RequestHandler vai modificar automaticamente os arquivos de layout e de views para aqueles que
     * correspondam ao tipo requisitado. Além disso, se um helper com o mesmo nome da extensão requisitada
     * existir, ele será adicionado ao array de helpers do controller. Por fim, se dados XML forem submetidos
     * para seus controllers, eles serão convertidos em objetos XML os quais são associados a
     * Controller:data, podendo então serem salvos como dados de model normalmente. Para fazer uso do
     * RequestHandler ele deve estar incluído no seu array de $components.
     * */
    public $components = array('RequestHandler');
    public $helpers = array('Js', 'CakePtbr.Formatacao');

    /**
     * Esta function é executada no load do controller, desta forma iniciando
     * todo o conteudo setado.
     */
    function beforeFilter() {
        $this->loadModel('Cliente');
        $this->loadModel('Pet');
    }

    public function setListas() {
        $clientes = $this->Cliente->find('list', array('fields' => 'id, nome'));
        $this->set('listClientes', $clientes);
    }

    /**
     * utilizado para carregar combobox via ajax
     */
    public function ajaxLoadPets() {
        $this->layout = false;
        if ($this->RequestHandler->isAjax()) {
            $params = array('conditions' => array('Pet.cliente_id' => $this->params['url']['clienteId']),
                'recursive' => -1,
                'fields' => array('id', 'nome'));

            $pets = $this->Pet->find('list', $params);

            $this->set('listPets', $pets);
        }
    }

    public function index() {

    }

    public function novo() {
        $this->setlistas();
        if ($this->request->is('post')) {
            $this->Atendimento->create();
            if ($this->Atendimento->save($this->request->data)) {
                $this->Session->setFlash('', 'alert_success');
                return $this->redirect(array('action' => 'novo'));
            } else {
                $this->Session->setFlash('', 'alert_warning');
                //$this->Session->setFlash(__('The servico could not be saved. Please, try again.'));
            }
        }
    }

    public function editar() {

    }

    public function fila() {
        $params['conditions'][]['Atendimento.ativo'] = 1;
        //$params['conditions'][]['Atendimento.datahora_chegada >='] = date('Y-m-d 00:00:00');
        //$params['conditions'][]['Atendimento.datahora_chegada <='] = date('Y-m-d 23:59:59');
        //$params['fields'][''] = 1;

        $alllist = $this->Atendimento->find('all', $params);
        $this->loadModel('Auxiliar');
        $atendimento_tipo = $this->Auxiliar->find('list', array('conditions' => array('Auxiliar.auxiliar' => 'atendimento_tipo'), 'fields' => 'codigo,valor'));
        $prioridade_tipo = $this->Auxiliar->find('list', array('conditions' => array('Auxiliar.auxiliar' => 'atendimento_prioridade'), 'fields' => 'codigo,valor'));

        if (is_array($alllist) && count($alllist) > 0) {


            foreach ($alllist as $k => $model) {
                $tempList = array();
                foreach ($model as $tabela => $values) {

                    switch ($tabela) {
                        case 'Cliente':
                            $tempList['cliente_nome'] = $values['nome'];
                            $tempList['cliente_apelido'] = $values['apelido'];
                            $tempList['cliente_email'] = $values['email'];
                            $tempList['cliente_tel_residencia'] = $values['tel_residencia'];
                            $tempList['cliente_tel_comercial'] = $values['tel_comercial'];
                            $tempList['cliente_celular'] = $values['celular'];

                            break;
                        case 'Pet':
                            $tempList['pet_nome'] = $values['nome'];
                            $tempList['pet_apelido'] = $values['apelido'];
                            $tempList['pet_idade'] = $values['idade'];
                            $tempList['pet_nascimento'] = $values['nascimento'];


                            break;
                        case 'Atendimento':
                            //atendimento_tipo
                            //prioridade_tipo
                            ////
                            ////card-info
                            //card-success == prioridade_baixa
                            //card-warning == prioridade_media
                            //card-danger  == prioridade_alta
                            if ($values['prioridade_tipo'] == 1) {
                                $card_color = 'card-success';
                            } elseif ($values['prioridade_tipo'] == 2) {
                                $card_color = 'card-warning';
                            } elseif ($values['prioridade_tipo'] == 3) {
                                $card_color = 'card-danger';
                            }
                            $tempList['atendimento_tipo'] = $atendimento_tipo[$values['atendimento_tipo']];
                            $tempList['prioridade_tipo'] = $values['prioridade_tipo'];
                            $tempList['card_color'] = $card_color;
                            $tempList['observacoes'] = $values['observacoes'];
                            $tempList['datahora_chegada'] = $values['datahora_chegada'];

                            break;
                    }
                }
                $listFila[$k] = $tempList;
            }
        }

        $this->set('listFila', $listFila);
    }

    public function agendar() {

    }

}
