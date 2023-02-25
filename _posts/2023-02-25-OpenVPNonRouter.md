---
layout: post
title: Поднимаем OpenVPN для роутера
tags: MacOS
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/OpenVPN/logo.png)

Интернеты всех страх окукливаются в рамках своих границ, но пока еще есть способы смотреть, качать, открывать благодаря VPNам. В данном посте я вам покажу как настроить VPN на вашем роутре. В моем роутере [AX5400 Wi-Fi 6 Router](https://www.tp-link.com/ru/home-networking/wifi-router/archer-ax73/) есть втроенный VPN клиент, он на многих роутреах есть в силу распростроненности протокола. 

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/OpenVPN/1.png)

### Как сделать?

План простой:

- покупаем VPS

- поднимаем OpenVPN 

- настраиваем OpenVPN на роутере

#### Покупаем VPS  

Выбор на ваш вкус. Любой сервис который работает и который вам нравится.

#### Поднимаем OpenVPN

Качаем и запускаем скрипт от [Nyr](https://github.com/tatarinovms/openvpn-install/commits?author=Nyr)

<code>
wget https://git.io/vpn -O openvpn-install.sh && bash openvpn-install.sh
<code> 

Отвечаем на вопросы скрипта:

<code>
Which protocol should OpenVPN use?
   1) UDP (recommended)
   2) TCP
<code>

- выбираем UDP

<code>
What port should OpenVPN listen to?
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
OpenVPN installation is ready to begin.
Press any key to continue...
<code>

- нажимаем Enter и ждемс

В конце вывода скрипта вы увидите такой текст 

<code>
....
Finished!

The client configuration is available in: /root/blog.ovpn

<code>

- это и есть нужный нам конфиг. Скачайте его через [scp](https://baks.dev/article/terminal/how-to-use-scp-command-to-securely-transfer-files), [sftp](https://www.digitalocean.com/community/tutorials/sftp-ru), просто скопируйте через cat себе в "блокнот"...кароче как-то добутьте файл c вируталки.


#### Настраиваем OpenVPN на роутере

- логинимся в вебморду роутера. У меня это 192.168.0.1 и вводим ваш пароль к роутеру

- переходим в пункт OpenVPN client и нажимаем ADD

- вводим название подключения (Description) и в секции Configuration File, выбираем и загружаем сохраненный вами конфиг ранее

- в моем роутере еще есть настройка списка устройств (Device List) для которых трафик идет через VPN. Т.е мы можем выбрать устройство для которого будет "работать" OpenVPN. Очень удобная функция

