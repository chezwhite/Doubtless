<?php
App::uses('AppController', 'Controller');

class UsuariosController extends AppController {
    
    public function login() {
        $this->layout = 'faq_life';
        
        //if already logged-in, redirect
        if($this->Session->check('Auth.User')){
            $this->redirect(array('action' => 'index'));      
        }
         
        // if we get the post information, try to authenticate
        if ($this->request->is('post')) {
            if ($this->Auth->login()) {
                $this->Session->setFlash(__('Welcome, '. $this->Auth->user('username')));
                $this->redirect($this->Auth->redirectUrl());
            } else {
                $this->Session->setFlash(__('Invalid username or password'));
            }
        } 
    }

    public function logout() {
        return $this->redirect($this->Auth->logout());
    }

    //El index de usuarios es el registro de un nuevo usuario
    public function index() {
        $this->layout = 'faq_life';
        if ($this->request->is('post')) {
                 
            $this->Usuario->create();
            if ($this->Usuario->save($this->request->data)) {
                $this->Session->setFlash(__('The user has been created'));
                $this->redirect(array('action' => '../../preguntas/index'));
            } else {
                $this->Session->setFlash(__('The user could not be created. Please, try again.'));
            }   
        }
    }

    public function view($id = null) {
        $this->layout = 'faq_life';
        $this->Usuario->id = $id;
        if (!$this->Usuario->exists()) {
            throw new NotFoundException(__('Invalid user'));
        }
        $this->set('usuario', $this->Usuario->findById($id));
    }

    public function edit($id = null) {
        $this->Usuario->id = $id;
        if (!$this->Usuario->exists()) {
            throw new NotFoundException(__('Invalid user'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->Usuario->save($this->request->data)) {
                $this->Flash->success(__('The user has been saved'));
                return $this->redirect(array('action' => '../usuarios/index'));
            }
            $this->Flash->error(
                __('The user could not be saved. Please, try again.')
            );
        } else {
            $this->request->data = $this->Usuario->findById($id);
            unset($this->request->data['Usuario']['password']);
        }
    }

    public function delete($id = null) {
        $this->request->allowMethod('post');

        $this->Usuario->id = $id;
        if (!$this->Usuario->exists()) {
            throw new NotFoundException(__('Invalid user'));
        }
        if ($this->Usuario->delete()) {
            $this->Flash->success(__('User deleted'));
            return $this->redirect(array('action' => 'index'));
        }
        $this->Flash->error(__('User was not deleted'));
        return $this->redirect(array('action' => 'index'));
    }
}
?>