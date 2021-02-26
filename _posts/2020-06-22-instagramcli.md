---
layout: post
title: Автоматизация сохранения данных из Instagram
tags: cli
---
Привет, дааа снова CLI утилита

### Зачем? 
Хочу периодически бэкапить некоторые Instagram аккаунты и опционально иметь возможность скачивать фото из профиля, сториз, IGTV видео, описание фото, само фото и пр. 
Также автоматизирую выкачивание фото, которые я добавил в сохранёнки, добавлю возможность выбирать какой аккаунт бекапить, просто подпиской на данного пользователя.
И выкачивание доступных сториз у пользователей. 

### Как сделаем?
Воспользуемся тулзой на Питоне [instaloader](https://instaloader.github.io/index.html) можете изучить, какие данные  вы сможете выкачивать с ее помощью.
Установлю программу и настрою ее на своей VPS и настрою вызов программы по крону.

### Делаем
Устанавливаем утилиту. Понятное дело нужен питон на машине:

<code>
pip3 install instaloader
</code>

- создаю отдельную папку для скаченных данных:

<code>
cd ~/tools
mkdir instagram
</code>

- настраиваем конфигурационный файл с логином и паролем с Instagram аккаунтом для утилиты:

<code>
vim ~/cd/.config/instaloader/main.conf
</code>

- вводим наш логин и пароль от учетной записи Instagram:

<code>
--login=cli_download_beaver_inst
--password=123456
</code>

- сохраняем файл

Я для этой утилиты завел отдельный аккаунт. Не стал привязывать свой основной [аккаунт](https://www.instagram.com/tatarinovms/) так как отдельным аккаунтом удобнее оперировать. 

- создаем скрипт для крона:
<code>
vim ~/.config/instaloader/cron.sh
</code>

- пишем простой скрипт:

<code>
#!/bin/bash
cd ~/tools/instagram/
instaloader +~/.config/instaloader/main.conf :stories -F -q
instaloader +~/.config/instaloader/main.conf :saved -F -q
instaloader +~/.config/instaloader/main.conf @cli_download_beaver_inst -F -q
</code>

Объясню каждую строчку:

- выкачиваем stories которые доступны в нашем аккаунте @cli_download_beaver_inst 

- выкачиваем все фотографии и данные которые мы добавили в сохранёнки для @cli_download_beaver_inst 

- выкачиваем все фотографии и данные пользователей, на которых подписан @cli_download_beaver_inst 

- ключ -q запускает программу в "тихом режиме" т.е показываются только ошибки

- ключ -F нам позволит нам пропускать скачивание, если мы уже скачивали данный файл:

<code>
tatarinovms/2020-08-01_11-14-15_UTC_profile_pic.jpg already exists
Retrieving posts from profile tatarinovms.
[   1/1064] tatarinovms/2020-07-17_17-55-20_UTC.jpg exists [Хозяин, ты что ешь? Прям это?] unchanged json
</code>

т.е например мы уже не будем перекачивать все 1064 фотки, так как они уже есть.

- сохраняем наш скрипт
- делаем наш скрипт исполняемым

<code>
chmod u+x ~/.config/instaloader/cron.sh
</code>

- настраиваем cron
Чтобы добавить задание в cron используем утилиту crontab: 

<code>
 crontab -e
</code>

- добавляем строчку:

<code>
0 20 * * * ~/.config/instaloader/cron.sh
</code>

- т.е мы вызываем скрипт каждый день в 20:00.

P.S если не знаете как крону указать нужное вам время, используете сайт [crontab.guru](https://crontab.guru) на нем можно подобрать желаемый вам вариант.

- сохраняем изменение в crontab:
Если появилась строчка:

<code>
crontab: installing new crontab
</code>

значит мы все сделали верно.

Вы прекрасны! Автоматизация во все дома!