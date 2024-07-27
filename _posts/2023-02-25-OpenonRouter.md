---
layout: post
title: Поднимаем ОткрытуюВиртуальнуюЧастнуюСеть для роутера
tags: MacOS
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/OpenRKN/logo.webp)

В данном посте я вам покажу как настроить ВЧС на вашем роутре. В моем роутере [AX5400 Wi-Fi 6 Router](https://www.tp-link.com/ru/home-networking/wifi-router/archer-ax73/) есть втроенный OpenВЧС клиент, он на многих роутерах есть, в силу распростроненности протокола. 

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/OpenRKN/1.webp)

### Как сделать?

План простой:

- покупаем VPS

- поднимаем OpenВЧС

- настраиваем подключение к OpenВЧС на роутере

#### Покупаем VPS  

Выбор на ваш вкус. Любой сервис который работает и который вам нравится.

#### Поднимаем OpenВЧС

Качаем и запускаем скрипт от [Nyr](https://github.com/tatarinovms/openvpn-install)

`wget https://raw.githubusercontent.com/tatarinovms/openvpn-install/master/openvpn-install.sh -O openvpn-install.sh && bash openvpn-install.sh`

Отвечаем на вопросы скрипте:

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/OpenRKN/carbon1.webp)

- выбираем UDP

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/OpenRKN/carbon2.webp)

— можно использовать дефолтный порт 1194. Нажимаем Enter

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/OpenRKN/carbon3.webp)

- рекомендую DNS от Google 

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/OpenRKN/carbon4.webp)

- вводим имя для первого пользователя

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/OpenRKN/carbon5.webp)

- нажимаем Enter и ждемс

В конце вывода скрипта вы увидите такой текст: 

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/OpenRKN/carbon6.webp)

- это и есть нужный нам конфиг. Скачайте его через [scp](https://baks.dev/article/terminal/how-to-use-scp-command-to-securely-transfer-files), [sftp](https://www.digitalocean.com/community/tutorials/sftp-ru), просто скопируйте через cat себе в "блокнот"...кароче как-то добутьте файл c вируталки.


#### Настраиваем коннект на роутере

- логинимся в вебморду роутера. У меня это 192.168.0.1 и вводим ваш пароль к роутеру

- переходим в пункт Open*** client и нажимаем ADD

- вводим название подключения (Description) и в секции Configuration File, выбираем и загружаем сохраненный вами конфиг ранее

- в моем роутере еще есть настройка списка устройств (Device List) для которых трафик идет через ВПН. Т.е мы можем выбрать устройство для которого будет "работать" OpenВПН. Очень удобная функция

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/OpenRKN/2.webp)
