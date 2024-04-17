---
layout: post
title: Запуск ВПН клиента без отсутствующей интеграции Shortcuts при старте Instagram
tags: iOS
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/ShortcutsVPN/logo.png)

*если у вас iOS 16.4, то рекомендую к прочтению данный пост:[Автовключение сетевого клиента в iOS 16.4 через Shortcuts при запуске приложения](https://blog.tatarinov.space/iOS164VPN/) 

### Как сделать?


– Запускаем Wireguard, подключаемся к вашему сетевому окружению

– Открываем в браузере на телефоне адрес [ifconfig.co](https://ifconfig.co) чтобы узнать внешний IP адрес вашего сетевого окружения. Запоминаем этот адрес

– Запускаем приложение Shortcuts

– Переходим в раздел Automation и нажимаем + Create Personal Automation

– App > Choose и выбираем Instagram и Is Opened

– Next

– Add action

– Get current IP address

– Выбираем следующее действие if

– Кликаем в поле Condition и выбираем is

– Кликаем в Text

– Вводим ваш внешний IP адрес VPN"а

– Добавляем новое действие Stop this shortcut

– Передвигаем его и ставим следующим действием после if

– Доблавляем действие Open App

– Кликаем в него и выбираем ваш VPN клиент. В моем случае это WireGuard

– Нажимаем Next

– Убираем переключатель Ask Before Running

– Нажимаем Done

Поясняющая картинка:

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/SVPN/list.png)

### Как работает?

Если у вас не был запущен ранее VPN, то при запуске Instagram сразу запустится WireGuard клиент. Вам достаточно будет просто включить VPN в клиенте и перейти вручную обратно в Instagram.