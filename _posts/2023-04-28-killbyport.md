---
layout: post
title: killport - убиваем процесс по сетевому порту
tags: Telegram
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/killport/logo.png)

Иногда во время разработки или тестирования необходимо быстро убить процесс, но вы знаете только порт на котором сервис поднялся. Быстро убить процесс по порту вам поможет программа — [killport](https://github.com/jkfran/killport)


### Установка

## Linux 

<code>
curl -sL https://bit.ly/killport | sh
<code>

## MacOS

<code>
brew tap jkfran/killport
brew install killport
<code>

### Использование

Если порт один:
<code>
killport 8080 
<code>

А если процессов несколько:

<code>
killport 443 8081 3001 
<code>
