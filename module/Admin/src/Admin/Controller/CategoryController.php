<?php

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;

class CategoryController extends AbstractActionController
{
    public function indexAction()
    {
        $entityManager = $this->getServiceLocator()->get('Doctrine\ORM\EntityManager');

        $query = $entityManager->createQuery('SELECT u FROM News\Entity\Category u ORDER BY u.id DESC');
        $rows = $query->getResult();

        return array('categories' => $rows);
    }
}