<?php

class DashboardsController extends AppController {

    public $uses = array('Dashboards');
    public $helpers = array('CakePtbr.Formatacao');

    public function index() {

    }

    public function financeiro() {
        //mktime(hora, min., seg., mês, dia, ano);
        $data_atual = date('Y-m-d'); //data atual
        $data_final = date('Y-m-d', mktime(0, 0, 0, date('m'), date('d') + 30, date('Y'))); //proximo mes

        //pagamentos do dia
        $this->loadModel('Pagar');
        $this->Pagar->virtualFields['count'] = 0;
        $w0Pagar = array('Pagar.ativo' => 1, 'Pagar.pago' => 0, 'Pagar.data_vencimento =' => $data_atual);
        $this->Pagar->virtualFields['total'] = 0;
        $pagamento_dia = $this->Pagar->find('first', array('fields' => 'sum(Pagar.valor) as Pagar__total, count(Pagar.id) as Pagar__count', 'conditions' => $w0Pagar));
        $this->set('pagamento_dia', $pagamento_dia['Pagar']['total']);
        $this->set('pcount_dia', $pagamento_dia['Pagar']['count']);

        //lista contas a pagar 30 dias
        $w1Pagar = array('conditions' => array('Pagar.ativo' => 1, 'Pagar.pago' => 0, 'Pagar.data_vencimento between' => $data_atual, "'$data_final'"));
        $listcontaspagar = $this->Pagar->find('all', $w1Pagar);
        $this->set('listcontaspagar', $listcontaspagar);
        
        //pagamentos em atraso
        $w2Pagar = array('Pagar.ativo' => 1, 'Pagar.pago' => 0, 'Pagar.data_vencimento <' => $data_atual);
        $this->Pagar->virtualFields['total_atraso'] = 0;
        $pagamentos_atrasados = $this->Pagar->find('first', array('fields' => 'sum(Pagar.valor) as Pagar__total_atraso, count(Pagar.id) as Pagar__count', 'conditions' => $w2Pagar));
        $this->set('pagamentos_atrasados', $pagamentos_atrasados['Pagar']['total_atraso']);        
        $this->set('pcount_atrasados', $pagamentos_atrasados['Pagar']['count']);


        //recebimentos do dia        
        $this->loadModel('Receber');
        $this->Receber->virtualFields['count'] = 0;
        $wReceber = array('Receber.ativo' => 1, 'Receber.recebido' => 0, 'Receber.data_vencimento =' => $data_atual);
        $this->Receber->virtualFields['total'] = 0;        
        $recebimento_dia = $this->Receber->find('first', array('fields' => 'sum(Receber.valor) as Receber__total, count(Receber.id) as Receber__count', 'conditions' => $wReceber));
        $this->set('recebimento_dia', $recebimento_dia['Receber']['total']);
        $this->set('rcount_dia', $recebimento_dia['Receber']['count']);
 
        //lista contas a receber 30 dias
        $this->loadModel('Receber');
        $w1Receber = array('conditions' => array('Receber.ativo' => 1, 'Receber.recebido' => 0, 'Receber.data_vencimento between' => $data_atual, "'$data_final'"));
        $listcontasreceber = $this->Receber->find('all', $w1Receber);
        $this->set('listcontasreceber', $listcontasreceber);  
        
        //recebimentos em atraso
        $w2Receber = array('Receber.ativo' => 1, 'Receber.recebido' => 0, 'Receber.data_vencimento <' => $data_atual);
        $this->Receber->virtualFields['total_atraso'] = 0;
        $recebimentos_atrasados = $this->Receber->find('first', array('fields' => 'sum(Receber.valor) as Receber__total_atraso, count(Receber.id) as Receber__count', 'conditions' => $w2Receber));
        $this->set('recebimentos_atrasados', $recebimentos_atrasados['Receber']['total_atraso']);   
        $this->set('rcount_atrasados', $recebimentos_atrasados['Receber']['count']);
        
    }

}
