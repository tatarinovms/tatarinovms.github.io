---
layout: post
title: Делаем свою "радиостанцию" в Telegram канале
tags: Telegram
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/logo.webp)

Давно уже в телеграм каналах и чатах есть поддержка стриминга по протоколу rtmps, но стримить из OBS, как-то банально. Решил я замутить свою "радиостанцию", которая всегда будет онлайн и будет стримиться с виртуальной машины. 

### Что нам нужно?

- Linux машина (у меня VDS с Ubuntu)

- Установленный ffmpeg

- Контент для трансляции

### Подготовка

#### Устанавливаем FFMPEG

Если на вашей Linux машине еще нет ffmpeg, то нужно его поставить! 

`apt install ffmpeg`

#### Создаем канал в Telegram

- Нажимаем создать Telegram канал, устанавливаем аватарку, даем имя

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/T1.webp)

#### Копируем ваш serverURL и stream Key

Для трансляции rtmps потока в стрим нам нужен ключ и сервер, забираем его из канала:

- Переходим в канал и нажимаем Live Stream

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/T1_2.webp)

- Выбираем Start With... 

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/T1_3.webp)

- Копируем ваши serverURL и stream key:

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/T1_4.webp)

### Начинаем трансляцию 

Я буду делать стриминг всех песен с радиостанции VRock из игры Grand Theft Auto: Vice City, но вы можете использовать и ваш файл(ы) или ре-стримить трансляцию чужую.

#### Запускаем трансляцию

- Логинимся в вашу Linux машину

- Готовим команду для запуска ffmpeg и получается вот такая команда:

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/command.webp)

[Скачать пример](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/scripts/TelegramRadio/command.txt)

- Запускаем ffmpeg в фоне, чтобы он не выключился после закрытия консоли и работал в фоне, для этого просто добавим символ &

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/commandend.webp)
#### Проверяем работу нашей трансляции

- Переходим в созданный [наш Telegram канал](https://t.me/beaverclanradiogta) и нажимаем Join на Live Stream

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/T1_5.webp)

- Слушаем станцию:

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/T1_6.webp)

- Пробуем с ПК: 

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/TelegramRadio/T1_7.webp)