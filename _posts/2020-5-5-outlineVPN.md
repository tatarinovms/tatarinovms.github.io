---
layout: post
title: Настройка VPN сервера Outline
tags: cli brew vpn
---
Простой способ поднять VPN сервер.

Для этого воспользуемся [Outline]((https://getoutline.org/en/home)). 

Outline еще хорош тем, что он использует протокол Shadowsocks.

### Подготовка
Нужна VPS на удобном вам сервисе в нужном вам регионе и на любом Linux.

Если у вас нет сервера, и вы не дружите с Linux, то рекомендую вам в Outline Manager выбрать DigitalOcean. 

Ваc проведут за руку и вы создадите VPS. 

Самая дешевая VPS в DO стоит 5$ в месяц. 

*P.S* можете воспользоваться промокодом на 100$ в DigitalOcean от [ подкаста radio-t]((https://radio-t.com/)), перейдите по ссылке http://do.co/radiot и зарегистрируйтесь. 

Или зарегистрируйте VPS на провайдере, где живет моя VPS vdsina.ru.

Ниже предоставлю вам мою реферельную [скидку-ссылку](https://vdsina.ru/?partner=rbc8le9r1g)

### Как сделать?

Screenshot-2020-05-27-at-17.08.07.png.jpg

- Скачиваем Outline Manager на ПК. Клиенты есть под [ Windows]((https://raw.githubusercontent.com/Jigsaw-Code/outline-releases/master/manager/stable/Outline-Manager.exe)), 
[ MacOS]((https://raw.githubusercontent.com/Jigsaw-Code/outline-releases/master/manager/stable/Outline-Manager.dmg)),
[Linux]((https://raw.githubusercontent.com/Jigsaw-Code/outline-releases/master/manager/stable/Outline-Manager.AppImage))

- Запускаем Outline Manager 

- Выбираем где находится ваша VPS, есть пресеты для DigitalOcean, Google Cloud Platform, Amazon, или как в моем случае — anywhere.

1.png

- Логинимся на вашу VPS по ssh, копируем команду из окна Outline Manager на установку сервера и выполняем ее на вашей VPS'ке

2.png

-  Смотрим как выполняется скрипт установки, на выходе он даст нам результат установки и ключ, который нужно будет скопировать в Outline Manager

<code>
> Verifying that Docker is installed .......... OK

> Verifying that Docker daemon is running ..... OK

> Creating persistent state dir ............... OK

> Generating secret key ....................... OK

> Generating TLS certificate .................. OK

> Generating SHA-256 certificate fingerprint .. OK

> Writing config .............................. OK

> Starting Shadowbox .......................... OK

> Starting Watchtower ......................... OK

> Waiting for Outline server to be healthy .... OK

> Creating first user ......................... OK

> Adding API URL to config .................... OK

> Checking host firewall ...................... OK

CONGRATULATIONS! Your Outline server is up and running.

</code>

данный вывод нам говорит, что сервер установится и через firewall он пролез. Если у вас провалился последний пункт, то рекомендую открыть на VPS порты -  50497 (TCP) и 48572 (TCP/UDP)

- Ниже будет ключ, который нам необходим для доступа к серверу:

<code>
{"apiUrl":"https://216.18.168.124:50498/dncg740tCsdsdsqeUYgTS","certSha256":"C9E81597DHKSHS7237232SDSA6A67D3B3B2064DA705SSSSDJSDHHCDI7772"}
</code>

- Копируем из консоли этот ключ и вставляем его в Outline Manager. И нажимаем Done. Вы подключились к серверу. 

Screenshot-2020-05-27-at-15.55.51.png

- Вы восхитительны!

Как создать ключ-ссылку для подключения клиента?

- В Outline Manager нажимаем Add new Key
- Указываем удобное название ключа
- При нажатии на кнопку Share у вас будет открываться окно с ссылкой, которая нам и пригодится для настройки подключения в клиенте.

Screenshot-2020-05-27-at-16.31.png

Как подключаться к VPN c пк и телефона?
 ПК
- Скачиваем клиент с [сайта]((https://s3.amazonaws.com/outline-vpn/invite.html#/en/home)) 

Screenshot-2020-05-27-at-16.18.52.png.jpg

Прямые ссылки: [Windows]((https://raw.githubusercontent.com/Jigsaw-Code/outline-releases/master/client/stable/Outline-Client.exe)), [MacOS]((https://itunes.apple.com/us/app/outline-app/id1356178125))

- Устанавливаем и запускаем клиент

- Переходим по ссылке полученной на предыдущем шаге. Нажимаем "Подключить это устройство"

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/outline/Screenshot-2020-05-27-at-16.38.34.png)

- Нажимаем "Копировать" 

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/outline/Screenshot-2020-05-27-at-16.38.53.png)

- Переключаемся на Outline и кликаем "Добавить сервер"

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/outline/Screenshot-2020-05-27-at-16.42.56.png)

– Подключаемся 

connect.png

- Проверяем
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/outline/Screenshot-2020-05-27-at-16.30.26.png)

### Вы восхитительны!

### Телефон
- Скачиваем клиент [iOS]((https://itunes.apple.com/us/app/outline-app/id1356177741)), 
[Android](https://play.google.com/store/apps/details?id=org.outline.android.client)
- Запускаем 
- Открываем в браузере ссылку полученную на предыдущем шаге. Нажимаем "Подключить это устройство"

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/outline/iOS1.jpg)

- Нажимаем "Копировать" 

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/outline/iOS2.jpg)

- Переключаемся в приложение и тапаем "Добавить сервер"

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/outline/iOS3.jpg)

- Подключаемся 

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/outline/iOS4.jpg)

### Вы восхитительны!