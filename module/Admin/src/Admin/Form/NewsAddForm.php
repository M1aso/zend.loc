<?php

namespace Admin\Form;

use Zend\Form\Form;
use Zend\Form\Element;

use DoctrineModule\Persistence\ObjectManagerAwareInterface;
use Doctrine\Common\Persistence\ObjectManager;

use Admin\Filter\NewsAddInputFilter;
use DoctrineModule\Stdlib\Hydrator\DoctrineObject as DoctrineHydrator;
use News\Entity\News;

class NewsAddForm extends Form implements ObjectManagerAwareInterface
{
    protected $objectManager;

    public function setObjectManager(ObjectManager $objectManager)
    {
        $this->objectManager = $objectManager;
    }

    public function getObjectManager()
    {
        return $this->objectManager;
    }

    public function __construct(ObjectManager $objectManager)
    {
        parent::__construct('newsAddForm');
        $this->setObjectManager($objectManager);
        $this->createElements();
    }

    public function createElements()
    {
        $this->setAttribute('method', 'post');
        $this->setAttribute('class', 'bs-example form-horizontal');

        $this->setInputFilter(new NewsAddInputFilter());

        $this->add(array(
            'type' => 'Text',
            'name' => 'created',
            'options' => array(
                'label' => 'Дата публикации',
            ),
            'attributes' => array(
                'class' => 'form-control',
                'required' => 'required',
            ),
        ));

        $this->add(array(
            'name' => 'updated',
            'type' => 'Hidden',
        ));

        $this->add(array(
            'name'    => 'title',
            'type'    => 'Text',
            'options' => array(
                'min'   => 3,
                'max'   => 255,
                'label' => 'Название',
            ),
            'attributes' => array(
                'class'    => 'form-control',
                'required' => 'required',
            ),
        ));

        $this->add(array(
            'name' => 'previewText',
            'type' => 'Textarea',
            'options' => array(
                'label' => 'Превью',
            ),
            'attributes' => array(
                'class' => 'form-control ckeditor',
            ),
        ));

        $this->add(array(
            'name' => 'fullText',
            'type' => 'Textarea',
            'options' => array(
                'label' => 'Описание',
            ),
            'attributes' => array(
                'class' => 'form-control ckeditor',
                'required' => 'required',
            ),
        ));



        $this->add(array(
            'type' => 'DoctrineModule\Form\Element\ObjectSelect',
            'name' => 'category',
            'options' => array(
                'label' => 'Категория',
                'empty_option' => 'Выберите категорию...',
                'object_manager' => $this->getObjectManager(),
                'target_class' => 'News\Entity\Category',
                'property' => 'categoryName',
            ),
            'attributes' => array(
                'class' => 'form-control',
                'required' => 'required',
            ),
        ));

        $this->add(array(
            'name' => 'isPublic',
            'type' => 'Checkbox',
            'options' => array(
                'label' => 'Опубликовать',
                'use_hidden_Element' => true,
                'checked_value' => 1,
                'unchecked_value' => 0,
            ),
        ));

        $this->add(array(
            'name' => 'submit',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Сохранить',
                'id' => 'btn_submit',
                'class' => 'btn btn-primary',
            ),
        ));
    }
}