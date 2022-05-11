---
layout: post
title: Изменение папки для скриншотов в МакОС
tags: cli macos
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/scr/logo.png)

Привет.
Мне не нравится, что папка по умолчанию для скриншотов в МакОС это рабочий стол, после долго использования рабочий стол превращается в помойку. Путь папки можно изменить.
### Как это сделать?
Открываем терминал и вводим команду:

<code>
defaults write com.apple.screencapture location ~/Pictures/Screenshots
</code>

вместо ~/Pictures/Screenshots вы можете ввести желаемый для вас путь для сохранение скринштов.


Перезагружаем UI. 
Теперь все скриншоты будут сохраняться в указанную вам папку

<code>
killall SystemUIServer
</code>
