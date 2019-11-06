<?php

namespace Admin\Controller;

use Application\Controller\BaseAdminController as BaseController;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator as DoctrineAdapter;
use Doctrine\ORM\Tools\Pagination\Paginator as ORMPaginator;
use Zend\Paginator\Paginator;

class NewsController extends BaseController
{
    public function indexAction()
    {
        $query = $this-> getEntityManager()->createQueryBuilder();
        $query
            ->select('a')
            ->from('\News\Entity\News', 'a')
            ->orderBy('a.id', 'DESC');

        $adapter = new DoctrineAdapter(new ORMPaginator($query));

        $paginator = new Paginator($adapter);
        $paginator->setDefaultItemCountPerPage(10);
        $paginator->setCurrentPageNumber((int) $this->params()->fromQuery('page', 1));

        return array('news' => $paginator);
    }
}
