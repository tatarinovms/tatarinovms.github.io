---
layout: post
title: Shadowrocket- удобное переключение ваших сетей на iOS
tags: MacOS
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/ShadowRocket/logo.png)

Shadowrocket - это прокси-клиент, основанный на правилах и маршрутизации. Очень гибкий клиент.

### Подготовка

#### Покупаем приложение Shadowrocket

[Ссылка](https://apps.apple.com/ru/app/shadowrocket/id932747118) на приложение Shadowrocket в Апстор. Да оно платное, но очень не дорого.

### Настраиваем

- Запускаем Shadowrocket

— На Вкладке Home добавляем все ваши необходимые соединения

— Открываем вкладку Config, жмем на + и добавляем ссылку на мой пример конфига в поле Download from URL и скачиваем мою рыбу:

<code>
https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/ShadowRocket/fish.conf
<code>

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/ShadowRocket/1.png)


Рыба содержит вот такую заготовку: 

<code>
[General]
bypass-system = true
skip-proxy = 127.0.0.1,10.0.0.0/8,localhost,*.local,captive.apple.com
bypass-tun = 10.0.0.0/8, 100.64.0.0/10, 127.0.0.0/8, 169.254.0.0/16, 172.16.0.0/12, 192.0.0.0/24, 192.0.2.0/24, 192.88.99.0/24, 192.168.0.0/16, 198.18.0.0/15, 198.51.100.0/24, 203.0.113.0/24, 224.0.0.0/4, 255.255.255.255/32
dns-server = 1.1.1.1,8.8.8.8
fallback-dns-server = system

[Rule]
DOMAIN-SUFFIX,2ip.ru,Network_1
DOMAIN-SUFFIX,ifconfig.me,Network_2
FINAL,DIRECT

[Host]
localhost = 127.0.0.1
<code>

— Открываем на редактирование нажимаем на ! 

- Нажимаем Rule и редактируем правила, какой адрес должен работать с конкретным вашим доступом или добавляем свои преффиксы и пр

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/ShadowRocket/2.png)

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/ShadowRocket/3.png)

### Запускам

— Переходим на вкладку Home

— Выбираем в Global - Config

— Передергиваем переключать наверху

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/ShadowRocket/4.png)


### Задача со звездочкой 

Чтобы вам проще вести списки, можно их грузить онлайн, ваш конфиг может выглядить так:

Все ваши Rule и сам конфиг можно грузить и по URL:

<code>
# Shadowrocket: 2024-04-13 12:31:00
[General]
bypass-system = true
skip-proxy = 127.0.0.1,10.0.0.0/8,localhost,*.local,captive.apple.com
bypass-tun = 10.0.0.0/8, 100.64.0.0/10, 127.0.0.0/8, 169.254.0.0/16, 172.16.0.0/12, 192.0.0.0/24, 192.0.2.0/24, 192.88.99.0/24, 192.168.0.0/16, 198.18.0.0/15, 198.51.100.0/24, 203.0.113.0/24, 224.0.0.0/4, 255.255.255.255/32
dns-server = 1.1.1.1,8.8.8.8
fallback-dns-server = system
update-url = https://blog.tatarinov.space/config.conf

[Rule]
RULE-SET,https://blog.tatarinov.space/externaladd.conf,Network_1
DOMAIN-SUFFIX,ifconfig.me,Network_2
FINAL,DIRECT

[Host]
localhost = 127.0.0.1
<code>

- update-url в секции General у вас грузит и основляет ваш конфиг,
- update-url в секции Rule у вас грузит и основляет ваш конфиг c правилами

Конфиг который содержится в секции RULE и вы тянете его по сети, может выглядить так:

<code>
DOMAIN-SUFFIX,ifconfig.me
<code>

