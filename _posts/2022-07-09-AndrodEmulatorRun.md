---
layout: post
title: Быстрый запуск Android эмулятора на MacOS
tags: MacOS
---

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/EmulAndroid/logo.png)

Часто пользуюсь эмулятором из Android Studio, и решил сделать его запуск более удобным. Как вы знаете консоль у меня всегда под рукой, поэтому сделаем удобный запуск эмулятора прямо из консоли.

### Как сделать? 

- необходимо отредактировать файл ~/.zshrc , я это делаю через vim

<code>
vim ~/.zshrc
<code>

- Добавляем в PATH путь к программе emulator

<code>
export PATH="/Users/anonname/Library/Android/sdk/emulator:$PATH"
<code>

где вместо anonname, ваше имя пользователя.

- Для того чтобы не выполнять длинную команду emulator -bla-bla, добавим alias 

<code>
alias emulls="emulator -list-avds"
alias emulrun="emulator -avd"
<code>

- сохраняем изменения в файле ~/.zshrc 

### Как работает? 

Команда emulls показывает список доступных эмуляторов, emulrun и имя эмулятора. Запускает его.
