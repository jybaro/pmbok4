<?php
class TermsController extends AppController {

	var $name = 'Terms';
	var $helpers = array('Html', 'Form');

	function index() {
		$this->Term->recursive = 0;
		$this->set('terms', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid Term.', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->set('term', $this->Term->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Term->create();
			if ($this->Term->save($this->data)) {
				$this->Session->setFlash(__('The Term has been saved', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The Term could not be saved. Please, try again.', true));
			}
		}
		$synonymChildren = $this->Term->SynonymChild->find('list');
		$relatedChildren = $this->Term->RelatedChild->find('list');
		$this->set(compact('synonymChildren', 'relatedChildren'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid Term', true));
			$this->redirect(array('action'=>'index'));
		}
		if (!empty($this->data)) {
			if ($this->Term->save($this->data)) {
				$this->Session->setFlash(__('The Term has been saved', true));
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash(__('The Term could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Term->read(null, $id);
		}
		$synonymChildren = $this->Term->SynonymChild->find('list');
		$relatedChildren = $this->Term->RelatedChild->find('list');
		$this->set(compact('synonymChildren','relatedChildren'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for Term', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Term->del($id)) {
			$this->Session->setFlash(__('Term deleted', true));
			$this->redirect(array('action'=>'index'));
		}
	}

}
?>