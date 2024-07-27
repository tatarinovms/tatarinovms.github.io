---
layout: post
title: Shadowrocket- удобное переключение ваших сетей на iOS
tags: MacOS
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/ShadowRocket/logo.webp)

Shadowrocket - это прокси-клиент, основанный на правилах и маршрутизации. Очень гибкий клиент.

### Подготовка

#### Покупаем приложение Shadowrocket

[Ссылка](https://apps.apple.com/ru/app/shadowrocket/id932747118) на приложение Shadowrocket в Апстор. Да оно платное, но очень не дорого.

### Настраиваем

- Запускаем Shadowrocket

- На Вкладке Home добавляем все ваши необходимые соединения

- Открываем вкладку Config, жмем на + и добавляем ссылку на мой пример конфига в поле Download from URL и скачиваем мою рыбу:


`https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/scripts/ShadowRocket/fish.conf`

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/ShadowRocket/1.webp)


Рыба содержит вот такую заготовку: 

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/ShadowRocket/fish.conf.webp)

— Открываем на редактирование нажимаем на ! 

- Нажимаем Rule и редактируем правила, какой адрес должен работать с конкретным вашим доступом или добавляем свои преффиксы и пр

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/ShadowRocket/2.webp)

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/ShadowRocket/3.webp)

### Запускаем

— Переходим на вкладку Home

— Выбираем в Global - Config

— Передергиваем переключать наверху

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/ShadowRocket/4.webp)


### Задача со звездочкой 

Чтобы вам проще вести списки, можно их грузить онлайн, ваш конфиг может выглядить так:

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/ShadowRocket/config.conf.webp)

- update-url в секции General у вас грузит и обновляет ваш основной конфиг,
- update-url в секции Rule у вас грузит и обновляет ваш конфиг c правилами c места где вы его разместили
