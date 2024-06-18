---
layout: post
title: Экспорт спейсов из браузера Arc в закладки
tags: MacOS
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/arc/logo.png)

В браузере Arc нет нативного способа экспорта ваших спейсов в "закладки" другого браузера. Т.е каждый спейс - папка в закладках. И как нам быть? Не вручную же копировать? 

### Что нам надо ? 

- МакОсь
- Установленный питон
- Браузер Арк
- Скрипт от [ivnvxd](https://github.com/ivnvxd/)

### Как нам надо? 

Сразу берем скрипт курлом и запускаемся: 

<code>
curl -o main.py https://raw.githubusercontent.com/ivnvxd/arc-export/main/main.py && python3 main.py
<code>


На выходе у нас получается файл: arc_bookmarks_2024_01_01.html 

Его уже суем в Firefox как HTML файл с закладками:

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/arc/2.png)

