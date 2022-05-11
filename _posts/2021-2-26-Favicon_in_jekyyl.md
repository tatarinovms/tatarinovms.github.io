---
layout: post
title: Создание и настройка favicon в Jekyll и не только
tags: Jekyll favicon
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/jekyll/logo.png)

Как вы видели мой блог немного поменялся. Увез я свой блог с хостинга и ушел с [CMS Эгея](https://blogengine.ru) претензии к Эгеи у меня нет, но давно руки чесались попробовать систему статической генерации сайтов. И я выбрал Jekyll.

Держать хостинг ради одного блога смысла уже нет, вот и уехал на Jekyll+GitHub Pages. Позже напишу гайд как все это просто и удобно завести, но для начала доковыряю шаблон сайта у себя и потом уже подготовлю гайд для вас. Вот взялся сделать корректный favicon который будет хорошо смотреться во всех местах где он используется.

## Генерируем корректные favicon

Для удобства генерации favicon и его проверки на сайтах существует ресурс [realfavicongenerator.net](https://realfavicongenerator.net)

### Создаем favicon
- переходим на сайт и загружаем нашу будущий favicon нажатием на Select your Favicon image
![загружаем ваш favicon](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/favicon/fav_1.png)
- настраиваем отображение favicon в разных системах
![настраиваем отображение](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/favicon/fav_2.png)

- В секции Favicon Generator Options указываем путь до ваших favicon
![указываем путь](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/favicon/fav_3.png)
- Скачиваем архив и копируем код который необходимо будет нам указать на сайте
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/favicon/fav_4.png)

### Загружаем favicon и прописываем их
- загружаем наши картинки по пути */assets/images* (ну больше для порядка)
- указываем путь к ним в секции <head> (в моем случае основная страница генерируется из default.html)
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/favicon/fav_5.png)
- проверяем работу наших favicon
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/favicon/fav_6.png)

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/favicon/fav_7.png)

Пам, вы восхитительны! Рекомендую этот ресурс даже у вас сайт не статический, а на любой CMS. Чай не вручную делать эти картинки.