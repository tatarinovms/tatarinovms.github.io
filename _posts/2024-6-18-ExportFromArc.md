---
layout: post
title: Итоги WWDC 2024
tags: MacOS
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/acr/logo.png)

В браузере Arc нет нативного способа экспорта ваших спейсов в "закладки" другого браузера. Т.е каждый спейс - папка в закладке. И как нам быть? Не вручную же копировать? 

### Что нам надо ? 

- MacOS
- Установленный питон
- Сам браузер Arc
- Скрипт от [ivnvxd](https://github.com/ivnvxd/)

### Как нам надо? 

Сразу берем скрипт курлом и запускаемся: 

<code>
curl -o main.py https://raw.githubusercontent.com/ivnvxd/arc-export/main/main.py && python3 main.py
<code>


На выходе у нас получается файл: arc_bookmarks_2024_01_01.html 

B его уже суем в Firefox:

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/acr/2.png)

