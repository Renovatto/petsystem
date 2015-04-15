<?php

App::uses('AuthComponent', 'Controller/Component');

class User extends AppModel {
    //encript da senha de usuario
    /*
      public function beforeSave($options = array()) {
      if (!empty($this->data['User']['password'])) {
      $this->data['User']['password'] = AuthComponent::password($this->data['User']['password']);
      }
      return true;
      }
     *
     */
}
