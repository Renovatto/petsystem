<?php

class SubSubMenuController extends AppController {

    public $uses = array('SubSubMenu'); //nome da model

    public function index() {

    }

    public function lista() {
        $params = array(
            'fields' => array('menuname', 'menulink', 'hassub', 'menuimageclass', 'menuposition', 'fathermenu'),
            'order' => array('menuposition'),
            'conditions' => array('menuposition >' => 0)
        );

        $subsubmenu = $this->SubSubMenu->find('all', $params);
        return $subsubmenu;
    }

}
