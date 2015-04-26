<?php

class DashboardsController extends AppController {

    public $uses = array('Dashboards');
    public $helpers = array('CakePtbr.Formatacao');

    public function index() {

    }

    public function financeiro() {
    	

		//mktime(hora, min., seg., mês, dia, ano);
		$data_atual = date('Y-m-d'); //data atual
		$data_final = date('Y-m-d',mktime(0,0,0,date('m'),date('d')+30,date('Y'))); //proximo mes

		$this->loadModel('Pagar');
    	$wPagar = array('Pagar.ativo'=>1,'Pagar.pago'=>0,'Pagar.data_vencimento between'=>$data_atual, "'$data_final'");
    	$this->Pagar->virtualFields['total'] = 0;
    	$total_pagar = $this->Pagar->find('first', array('fields' => 'sum(Pagar.valor) as Pagar__total','conditions' => $wPagar));
    	$this->set('total_pagar', $total_pagar['Pagar']['total']);

    	
    	$w2Pagar = array('Pagar.ativo'=>1,'Pagar.pago'=>0,'Pagar.data_vencimento <'=>$data_atual);
    	$this->Pagar->virtualFields['total_atraso'] = 0;
    	$total_atraso = $this->Pagar->find('first', array('fields' => 'sum(Pagar.valor) as Pagar__total_atraso','conditions' => $w2Pagar));
    	$this->set('total_atraso', $total_atraso['Pagar']['total_atraso']);    	

		$this->loadModel('Receber');
    	$wReceber = array('Receber.ativo'=>1,'Receber.recebido'=>0,'Receber.data_vencimento between'=>$data_atual, "'$data_final'");
    	$this->Receber->virtualFields['total'] = 0;
    	$total_receber = $this->Receber->find('first', array('fields' => 'sum(Receber.valor) as Receber__total','conditions' => $wReceber));
        $this->set('total_receber', $total_receber['Receber']['total']);


    }

}
