---
layout: post
title: Делаем свою "радиостанцию" в Telegram канале
tags: Telegram
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/logo.png)

Давно уже в телеграм каналах и чатах есть поддержка стриминга по протоколу rtmps, но стримить из OBS, как-то банально. Решил я замутить свою "радиостанцию", которая всегда будет онлайн и будет стримиться с виртуальной машины. 

Что нам нужно?
- Linux машина (у меня VDS с Ubuntu)
- Установленный ffmpeg
- Контент для трансляции

### Подготовка

#### Устанавливаем FFMPEG

Если на вашей Linux машине еще нет ffmpeg, то нужно его поставить! 

<code>
apt install ffmpeg
<code>

#### Создаем канал в Telegram

- Нажимаем создать Telegram канал, устанавливаем аватарку, даем имя

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/T1.png)

#### Копируем ваш serverURL и stream Key

Для трансляции rtmps потока в стрим нам нужен ключ и сервер, забираем его из канала:

- Переходим в канал и нажимаем Live Stream

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/T1_2.png)

- Выбираем Start With... 

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/T1_3.png)

- Копируем ваши serverURL и stream key:

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/T1_4.png)

### Начинаем трансляцию 

Я буду делать стриминг всех песен с радиостанции VRock из игры Grand Theft Auto: Vice City, но вы можете использовать и ваш файл(ы) или ре-стримить трансляцию чужую.

#### Запускаем трансляцию

- Логинимся в вашу Linux машину

- Готовим команду для запуска ffmpeg:

<code>
ffmpeg -nostdin -hide_banner -nostats -loglevel panic -stream_loop -1 -re -i {путь к файлу для стриминга} -c:v libx264 -preset veryfast -b:v 3500k -maxrate 3500k -bufsize 5000k -pix_fmt yuv420p -g 50 -c:a aac -b:a 64k -ac 2 -ar 44100 -f flv {serverURL из Telegram}{stream key из Telegram}
<code>

Получается вот такая команда:

<code>
ffmpeg -nostdin -hide_banner -nostats -loglevel panic -stream_loop -1 -re -i ./gtavc_vr_radio.mp4 -c:v libx264 -preset veryfast -b:v 3500k -maxrate 3500k -bufsize 5000k -pix_fmt yuv420p -g 50 -c:a aac -b:a 64k -ac 2 -ar 44100 -f flv rtmps://dc4-1.rtmp.t.me/s/1234567890:qwerty-asdfg_ZXCvc
<code>

- Запускаем ffmpeg в фоне, чтобы он не выключился после закрытия консоли и работал в фоне:

<code>
nohup ffmpeg -nostdin -hide_banner -nostats -loglevel panic -stream_loop -1 -re -i ./gtavc_vr_radio.mp4 -c:v libx264 -preset veryfast -b:v 3500k -maxrate 3500k -bufsize 5000k -pix_fmt yuv420p -g 50 -c:a aac -b:a 64k -ac 2 -ar 44100 -f flv rtmps://dc4-1.rtmp.t.me/s/1234567890:qwerty-asdfg_ZXCvc &
<code>

#### Проверяем работу нашей трансляции

- Переходим в созданный [наш Telegram канал](https://t.me/beaverclanradiogta) и нажимаем Join на Live Stream

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/T1_5.png)

- Слушаем станцию:

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/T1_6.png)

- Пробуем с ПК: 

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/T1_7.png)

