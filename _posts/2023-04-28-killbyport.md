---
layout: post
title: killport - убиваем процесс по сетевому порту
tags: Telegram
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/killport/logo.webp)

Иногда во время разработки или тестирования необходимо быстро убить процесс, но вы знаете только порт на котором сервис поднялся. Быстро убить процесс по порту вам поможет программа — [killport](https://github.com/jkfran/killport)


### Установка

## Linux 

`curl -sL https://bit.ly/killport | sh`

## MacOS

`brew tap jkfran/killport`

`brew install killport`

### Использование

Если порт один:

`killport 8080`

А если процессов несколько:

`killport 443 8081 3001`
