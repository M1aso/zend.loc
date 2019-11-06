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

    public function editAction()
    {
        $message = $status = '';
        $em = $this->getEntityManager();
        $form = new NewsAddForm($em);

        $id = (int) $this->params()->fromRoute('id', 0);
        $news = $em->find('News\Entity\News', $id);

        if(empty($news)){
            $message = 'Новость не найдена';
            $status = 'error';
            $this->flashMessenger()
                ->setNamespace($status)
                ->addMessage($message);

            return $this->redirect()->toRoute('admin/news');
        }

        $form->setHydrator(new DoctrineHydrator($em, '\News'));
        $form->bind($news);
        $form->get('created')->setValue($news->getCreated()->format('m/d/Y H:i'));
        $form->get('updated')->setValue($news->getUpdated()->format('m/d/Y H:i'));
        $request = $this->getRequest();

        if ($request->isPost())
        {
            $data = $request->getPost();
            $form->setData($data);
            $datetime = new \DateTime("now");

            if ($form->isValid()){

                $news->setUpdated($datetime);
                $em->persist($news);
                $em->flush();

                $status = 'success';
                $message = 'Новость обновлена';
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
            return array('form' => $form, 'id' => $id);
        }

        if ($message)
        {
            $this->flashMessenger()
                ->setNamespace($status)
                ->addMessage($message);
        }

        return $this->redirect()->toRoute('admin/news');
    }

    public function deleteAction()
    {
        $id = (int) $this->params()->fromRoute('id', 0);
        $em = $this->getEntityManager();

        $status = 'success';
        $message = 'Запись удалена';

        try {
            $repository = $em->getRepository('News\Entity\News');
            $news = $repository->find($id);
            $em->remove($news);
            $em->flush();
        }
        catch (\Exception $ex) {
            $status = 'error';
            $message = 'Ошибка удаления записи: ' . $ex->getMessage();
        }

        $this->flashMessenger()
            ->setNamespace($status)
            ->addMessage($message);

        return $this->redirect()->toRoute('admin/news');
    }
}
