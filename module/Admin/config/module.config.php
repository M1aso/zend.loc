<?php

return array(

    'controllers' => array(
        'invokables' => array(
            'Admin\Controller\Index' => 'Admin\Controller\IndexController',
            'category' => 'Admin\Controller\CategoryController',
            'news' => 'Admin\Controller\NewsController',
        ),
    ),

    'router' => array(
        'routes' => array(
            'admin' => array(
                'type' => 'literal',
                'options' => array(
                    'route' => '/admin/',
                    'defaults' => array(
                        'controller' => 'Admin\Controller\Index',
                        'action' => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    'category' => array(
                        'type' => 'segment',
                        'options' => array(
                            'route' => 'category/[:action/][:id/]',
                            'defaults' => array(
                                'controller' => 'category',
                                'action' => 'index',
                            ),
                        ),
                    ),
                    'news' => array(
                        'type' => 'segment',
                        'options' => array(
                            'route' => 'news/[:action/][:id/]',
                            'defaults' => array(
                                'controller' => 'news',
                                'action' => 'index',
                            ),
                        ),
                    ),
                ), //< child_routes
            ),
        ),
    ),

    'view_manager' => array(
        'template_path_stack' => array(
            __DIR__ . '/../view',
        ),
        'template_map' => array(
            'pagination_control' => __DIR__ . '/../view/layout/pagination_control.phtml',
        ),
    ),
);