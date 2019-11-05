<?php

namespace Admin\Controller;

use Application\Controller\BaseAdminController as BaseController;

class CategoryController extends BaseController
{
    public function indexAction()
    {
        $query = $this->getEntityManager()->createQuery('SELECT u FROM News\Entity\Category u ORDER BY u.id DESC');
        $rows = $query->getResult();

        return array('categories' => $rows);
    }
}