News Application
=======================

Технологии
------------
ZF 2 (version 2.4.11)

DoctrineORMModule (version 0.9.0)

ZendDeveloperTools (version 1.0.0)

EdpModuleLayouts (https://github.com/ericpaige/EdpModuleLayouts)

PostgreSQL (version 9.6) - Дамп базы для примера "**misc/dump.sql**"

Функционал
------------
1. / – отображение списка новостей (анонсы новостей -> загловок + анонс + дата создания);
2. /news/$id_news/ – просмотр новости целиком с $id_news;
3. /admin/news/add – страница добавления новости;
4. /admin/news/edit/$id_news/ – редактирование новости;
5. отдельный action на удаление новости;
6. /admin/news/ - ссылки на список новостей и добавление новости;
7. /admin/category/ - ссылки на список категорий новостей и добавление категории;
8. отдельный action на удаление категории;