---
layout: post
title: Поднимаем Open{роскомнадзор} для роутера
tags: MacOS
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/OpenRKN/logo.png)

В данном посте я вам покажу как настроить {роскомнадзор} на вашем роутре. В моем роутере [AX5400 Wi-Fi 6 Router](https://www.tp-link.com/ru/home-networking/wifi-router/archer-ax73/) есть втроенный Open{роскомнадзор} клиент, он на многих роутерах есть, в силу распростроненности протокола. 

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/OpenRKN/1.png)

### Как сделать?

План простой:

- покупаем VPS

- поднимаем Open 

- настраиваем подключение к Open{роскомнадзор} на роутере

#### Покупаем VPS  

Выбор на ваш вкус. Любой сервис который работает и который вам нравится.

#### Поднимаем Open{роскомнадзор}

Качаем и запускаем скрипт от [Nyr](https://github.com/tatarinovms/openvpn-install)

<code>
wget https://git.io/vpn -O openvpn-install.sh && bash openvpn-install.sh
<code> 

Отвечаем на вопросы скрипта:

<code>
Which protocol should Open*** use?
   1) UDP (recommended)
   2) TCP
<code>

- выбираем UDP

<code>
What port should Open*** listen to?
Port [1194]:
<code>

— можно использовать дефолтный порт 1194. Нажимаем Enter

<code>
Select a DNS server for the clients:
   1) Current system resolvers
   2) Google
   3) 1.1.1.1
   4) OpenDNS
   5) Quad9
   6) AdGuard
DNS server [1]:
<code>

- рекомендую DNS от Google

<code>
Enter a name for the first client:
Name [client]:
<code>

- вводим имя для первого пользователя

<code>
Open*** installation is ready to begin.
Press any key to continue...
<code>

- нажимаем Enter и ждемс

В конце вывода скрипта вы увидите такой текст 

<code>
....
Finished!

The client configuration is available in: /root/blog.oВПН

<code>

- это и есть нужный нам конфиг. Скачайте его через [scp](https://baks.dev/article/terminal/how-to-use-scp-command-to-securely-transfer-files), [sftp](https://www.digitalocean.com/community/tutorials/sftp-ru), просто скопируйте через cat себе в "блокнот"...кароче как-то добутьте файл c вируталки.


#### Настраиваем коннект на роутере

- логинимся в вебморду роутера. У меня это 192.168.0.1 и вводим ваш пароль к роутеру

- переходим в пункт Open*** client и нажимаем ADD

- вводим название подключения (Description) и в секции Configuration File, выбираем и загружаем сохраненный вами конфиг ранее

- в моем роутере еще есть настройка списка устройств (Device List) для которых трафик идет через ВПН. Т.е мы можем выбрать устройство для которого будет "работать" OpenВПН. Очень удобная функция

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/OpenRKN/2.png)
