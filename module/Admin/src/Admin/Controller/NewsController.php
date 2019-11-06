<?php

namespace Admin\Controller;

use Application\Controller\BaseAdminController as BaseController;

use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator as DoctrineAdapter;
use Doctrine\ORM\Tools\Pagination\Paginator as ORMPaginator;
use Zend\Paginator\Paginator;

use News\Entity\News;

use Admin\Form\NewsAddForm;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;

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
        $paginator->setDefaultItemCountPerPage(5);
        $paginator->setCurrentPageNumber((int) $this->params()->fromQuery('page', 1));

        return array('news' => $paginator);
    }

    public function addAction()
    {
        $em = $this->getEntityManager();
        $form = new NewsAddForm($em);

        $request = $this->getRequest();
        if ($request->isPost())
        {
            $message = $status = '';

            $data = $request->getPost();

            $news = new News();
            $form->setHydrator(new DoctrineHydrator($em, '\News'));
            $form->bind($news);
            $form->setData($data);
            $datetime = new \DateTime("now");

            if ($form->isValid())
            {
                $news->setUpdated($datetime);
                $em->persist($news);
                $em->flush();

                $status = 'success';
                $message = 'Новость добавлена';
            } else {
                $status = 'error';
                $message = 'Ошибка параметров';

                foreach ($form->getInputFilter()->getInvalidInput() as $errors) {
                    foreach ($errors->getMessages() as $error) {
                        $message .= ' ' . $error;
                    }
                }
            }
        } else {
            return array('form' => $form);
        }

        if ($message)
        {
            $this->flashMessenger()
                ->setNamespace($status)
                ->addMessage($message);
        }

        return $this->redirect()->toRoute('admin/news');
    }
}
