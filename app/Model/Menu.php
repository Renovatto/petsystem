<?php

class Menu extends AppModel {

    public $useTable = 'system_menus';
    public $cacheQueries = true;

    //public $hasMany = array('SubMenu'); //Menu contem muitos SubMenus
}
