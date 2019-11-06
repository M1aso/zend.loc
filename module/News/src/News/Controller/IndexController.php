<?php

namespace News\Controller;

use Application\Controller\BaseController as BaseController;

use News\Entity\News;

use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator as DoctrineAdapter;
use Doctrine\ORM\Tools\Pagination\Paginator as ORMPaginator;
use Zend\Paginator\Paginator;

class IndexController extends BaseController
{
    public function indexAction()
    {
        $query = $this->getEntityManager()->createQueryBuilder();

        $query
            ->add('select', 'a')
            ->add('from', 'News\Entity\News a')
            ->add('where', 'a.isPublic=true')
            ->add('orderBy', 'a.id ASC');

        $adapter = new DoctrineAdapter(new ORMPaginator($query));

        $paginator = new Paginator($adapter);
        $paginator->setDefaultItemCountPerPage(5);
        $paginator->setCurrentPageNumber((int) $this->params()->fromQuery('page', 1));

        return array('news' => $paginator);
    }

    public function newsAction()
    {
        $id = (int) $this->params()->fromRoute('id', 0);
        $em = $this->getEntityManager();
        $news = $em->find('News\Entity\News', $id);

        if(empty($news)){
            return $this->notFoundAction();
        }

        return array('news' => $news);
    }
}
