<?php

class MenuController extends AppController {

    public $uses = array('Menu'); //nome da model

    public function index() {

    }

    public function getMenu() {
        if ($this->request->isRequested()) {
            $listamenu = $this->lista();
            $listasubmenu = $this->requestaction('/submenu/lista');
            $listasubsubmenu = $this->requestaction('/subsubmenu/lista');

            foreach ($listamenu as $x => $menu) {
                $xmenu[$menu['menuname']] = $menu;

                foreach ($listasubmenu as $y => $submenu) {
                    $submenu = $submenu['SubMenu'];
                    //echo "{$menu['id']} ==> {$submenu['fathermenu']}<br>";
                    if ($menu['id'] == $submenu['fathermenu']) {
                        $xmenu[$menu['menuname']]['SubMenu'][$submenu['menuname']] = $submenu;
                    } else {
                        continue;
                    }

                    foreach ($listasubsubmenu as $w => $subsubmenu) {
                        $subsubmenu = $subsubmenu['SubSubMenu'];
                        //echo "{$submenu['id']} ==> {$subsubmenu['fathermenu']}<br>";
                        if ($submenu['id'] == $subsubmenu['fathermenu']) {
                            $xmenu[$menu['menuname']]['SubMenu'][$submenu['menuname']] = $submenu;
                            $xmenu[$menu['menuname']]['SubMenu'][$submenu['menuname']]['SubSubMenu'][$subsubmenu['menuname']] = $subsubmenu;
                        } else {
                            continue;
                        }
                    }
                }
            }
        }
        return $xmenu;
    }

    public function lista() {
        $params = array(
            'fields' => array('id', 'menuname', 'menulink', 'hassub', 'menuimageclass', 'menuposition'),
            'order' => array('menuposition'),
            'conditions' => array('menuposition >' => 0)
        );
        $menu = $this->Menu->find('all', $params);
        foreach ($menu as $model => $values) {
            $listMenu[] = $values['Menu'];
        }

        return $listMenu;
    }

}
