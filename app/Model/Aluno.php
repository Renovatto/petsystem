<?php

App::uses('AppModel', 'Model');

/**
 * Aluno Model
 *
 */
class Aluno extends AppModel {

    public $useTable = 'alunos';
    public $actsAs = array('CakePtbr.AjusteData');

}
