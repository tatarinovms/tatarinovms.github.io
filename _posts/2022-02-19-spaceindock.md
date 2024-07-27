---
layout: post
title: Как сделать пробелы в Dock?
---

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/dock/logo.webp)

Чтобы наглядно рассортировать ваши приложения в Dock можно добавить разделитель, по сути это будет пустой значок.

Для добавление узкого разделителя выполните комманду:

`defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'; killall Dock`
 
Для добавления большого разделителя выполните комманду:

`defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock`

Разделители передвигаются и удаляются как обычные значки программ в dock.
