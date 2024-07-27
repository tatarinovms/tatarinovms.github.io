---
layout: post
title: Подключение Yandex.Disk по WebDav
tags: iOS, Yandex 
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/YandexWebDav/logo.webp)

Краткий гайд, как подключить YandexDisk по протоколу WebDav.

### Генерация пароля для приложения

Yandex рекомендует создать отдельный пароль для каждого стороннего приложения, которым требуется ваш пароль на Яндексе:

Для этого воспользуйтесь этим гайдом от [Yandex](https://yandex.ru/support/id/authorization/app-passwords.html) 

### Подключаем Yandex по WebDav в приложении

- Запускаем приложение в котором есть WebDav клиент. В моем случае это [Documents by Readdle](https://apps.apple.com/us/app/documents-by-readdle/id364901807) для iPadOS

- Выбираем WebDav Server

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/YandexWebDav/select.webp)

- Вводим параметры для подключения:

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/YandexWebDav/input.webp)

Title: Название коннекта

URL: https://webdav.yandex.ru

Login: ваш логин Yandex

Password: ваш сгенерированный пароль для приложения

— Открываем созданное подключение

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/YandexWebDav/connect.webp)

### Готово