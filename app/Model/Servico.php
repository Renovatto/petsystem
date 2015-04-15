<?php

App::uses('AppModel', 'Model');

/**
 * Servico Model
 *
 */
class Servico extends AppModel {

    /**
     * Display field
     *
     * @var string
     */
    public $displayField = 'id';
    public $actsAs = array('CakePtbr.AjusteFloat');

    /**
     * Validation rules
     *
     * @var array
     */
    public $validate = array(
        'codinterno' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            //'message' => 'Campo obrigatório, por favor preencha este campo',
            //'allowEmpty' => false,
            //'required' => false,
            //'last' => false, // Stop validation after this rule
            //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
        'descricao' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            //'message' => 'Your custom message here',
            //'allowEmpty' => false,
            //'required' => false,
            //'last' => false, // Stop validation after this rule
            //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
        'ativo' => array(
            'numeric' => array(
                'rule' => array('numeric'),
            //'message' => 'Your custom message here',
            //'allowEmpty' => false,
            //'required' => false,
            //'last' => false, // Stop validation after this rule
            //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
    );

}
