---
layout: post
title: Как сделать пробелы в Dock?
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/assets/images/dock.png)

Чтобы наглядно рассортировать ваши приложения в Dock можно добавить разделитель, по сути это будет пустой значок.

Для добавление узкого разделителя выполните комманду:

<code>
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'; killall Dock
</code>
 
Для добавления большого разделителя выполните комманду:

 <code>
 defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock
 </code>


 Разделители передвигаются и удаляются как обычные значки программ в dock.
