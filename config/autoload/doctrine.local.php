<?php

return array(
    'doctrine' => array(
        'connection' => array(
            'orm_default' => array(
                // default connection name
                'driverClass' => 'Doctrine\DBAL\Driver\PDOPgSql\Driver',
                'params' => array(
                    'host'     => 'localhost',
                    'port'     => '5432',
                    'user'     => 'zf2_stud_news',
                    'password' => 'zf2_stud_news',
                    'dbname'   => 'zf2_stud_news',
                    'charset'  => 'UTF8',
                ),
            ),
        ),
    ),
);
