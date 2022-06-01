---
layout: post
title: Google Photo - удаление всех фото
tags: MacOS
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/GP/logo.png)


Как мы знаем сейчас не оплатить нормально Goolge аккаунт в РФ. Пришлось перехать на альтернативные места хранение фото и файлов. Решил удалить все фотографии накопленные годами в Google Photos, но есть НО...нет кнопки удалить все фото.
Удалить их можно только через браузер или мобильное приложение. Так причем в браузере имеется ограничение на выбор фотографии, удалить сразу более 500 штук нет возможности. Оффициальный ответ Google: "Выбирайте по 500 штук и удаляйте"

Но это как-то не по христиански, не наш путь...

## Что нам нужно?

### Переключить интерфейс Google Photos и браузера на английский язык

Если вы по каким-то причинам не используете английский язык в интерфейсах программ и ОС, то необходимо переключиться на английский.

- Переходим по адресу https://myaccount.google.com/language и делаем основным языком (PREFERRED LANGUAGE) English

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/GP/lang.png)

- В браузере тоже выставляем Английский язык (настройки зависят от браузера) 

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/GP/lang2.png)

### Выполняем скрипт для удаления

- Открываем [Google Photos](https://photos.google.com) в браузере

- Запускаем консоль разработчика Command+Option+J на MacOS или Control+Shift+J на Win

- Копипастим скрипт из [файла](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/GP/script.txt) в буфер обмена и вставляем его в секцию Console и нажимаем Enter

P.S скрипт честно взял [тут](https://github.com/mrishab/google-photos-delete-tool/blob/master/delete_photos.js) на ваше усмотрение можете отредактировать строчки:

<code>press_button_delay: 300 <code> 

можно поставить поменьше время, все зависит от того сколько вы готовы ждать появление кнопки "Move to trash" в моем случае я ставил 200. Время считается в миллисекундах. 

Если у вас очень много фото, то сделайте больше значение у параметра 
<code>delete_cycle<code> 

например: 1000000


![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/GP/script.png)

- Оставляем окно браузера в покое и ждем когда все фотки улетят в корзину

- У меня удаление всех фото заняло ~3 часа

