<?php

class PostsController extends AppController
{
  public $helpers = array('Html', 'Form');

  public function index()
  {
    $this->set('posts', $this->Post->find('all'));
    $this->set('title_for_layout', '記事一覧');
  }

  public function view($id = null)
  {
    $this->Post->id = $id;
    $this->set('post', $this->Post->read());
  }

  public function add()
  {
    if ($this->request->is('post')) {
      if ($this->Post->save($this->request->data)) {
        $this->Session->setFlash('Success!');
        $this->redirect(array('action' => 'index'));
      } else {
        $this->Session->setFlash('faild!');
      }
    }
  }

  public function edit($id = null)
  {
    $this->Post->id = $id;
    if (!$this->Post->exists()) {
      throw new Exception();
    }
    //editの画面表示処理
    $this->request->data = $this->Post->read();
  }

  function ajax_edit($id = null){
    $this->Post->id = $id;
    if ($this->request->is('get')) {
      throw new MethodNotAllowedException();
    }
    if ($this->request->is('ajax')) {
      if ($this->Post->save($this->request->data)) {
        $this->autoRender = false;
        $this->autoLayout = false;
        $response = array('id' => $id);
        $this->header('Content-type: application/json');
        echo json_encode($response);
      }
    }
  }
  

    public function delete($id){
    if ($this->request->is('get')) {
      throw new MethodNotAllowedException();
    }
    if ($this->request->is('ajax')) {
      if ($this->Post->delete($id)) {
        $this->autoRender = false;
        $this->autoLayout = false;
        $response = array('id' => $id);
        $this->header('Content-type: application/json');
        echo json_encode($response);
        exit();
      }
    }
    $this->redirect(array('action' => 'index'));
  }
}
