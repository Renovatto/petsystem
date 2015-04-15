<?php

class SubMenuController extends AppController {

    public $uses = array('SubMenu'); //nome da model

    public function index() {

    }

    public function lista() {
        $params = array(
            'fields' => array('id', 'menuname', 'menulink', 'hassub', 'menuimageclass', 'menuposition', 'fathermenu', 'menu_id'),
            'order' => array('menuposition'),
            'conditions' => array('menuposition >' => 0)
        );

        $submenu = $this->SubMenu->find('all', $params);
        return $submenu;

        $submenu = $this->SubMenu->find('all', $params);
        foreach ($submenu as $model => $values) {
            $listaSubMenu[] = $values['SubMenu'];
        }

        return $listaSubMenu;
    }

}
