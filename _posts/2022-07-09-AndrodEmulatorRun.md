---
layout: post
title: Быстрый запуск Android эмулятора на MacOS
tags: MacOS
---

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/EmulAndroid/logo.webp)

Часто пользуюсь эмулятором из Android Studio, и решил сделать его запуск более удобным. Как вы знаете консоль у меня всегда под рукой, поэтому сделаем удобный запуск эмулятора прямо из консоли.

### Как сделать? 

- необходимо отредактировать файл ~/.zshrc , я это делаю через vim

`vim ~/.zshrc`

- Добавляем в PATH путь к программе emulator

`export PATH="/Users/anonname/Library/Android/sdk/emulator:$PATH"`

где вместо anonname, ваше имя пользователя.

- Для того чтобы не выполнять длинную команду emulator -bla-bla, добавим alias 

`alias emulls="emulator -list-avds"`

`alias emulrun="emulator -avd"`

- сохраняем изменения в файле ~/.zshrc 

### Как работает? 

Команда emulls показывает список доступных эмуляторов, emulrun и имя эмулятора. Запускает его.
