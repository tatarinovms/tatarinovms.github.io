---
layout: post
title: Запуск VPN клиента без отсутствующей интеграции Shortcuts при старте Instagram
tags: iOS
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/ShortcutsVPN/logo.png)

*ексли у вас iOS 16.4, то рекомендую к прочтению данный пост:[Авключения VPN в iOS 16.4 через Shortcuts при запуске приложения](https://blog.tatarinov.space/iOS164VPN/) 

Как мы знаем на территории РФ почти все сервисы компании Meta признаны экстремистскими организациями. Но пользоваться ими можно и иногда нужно, конечно же через VPN.

Для того чтобы не забывать запускать VPN при открытии Instagram предлагаю воспользоваться приложением Shortcuts. Данный способ подходит для VPN приложений у которых отсутствует интеграция с Shortcuts. Мой VPN клиент именно такой. Я использую WireGuard.

### Как сделать?


– Запускаем Wireguard VPN, подключаемся к вашему VPN

– Открываем в браузере на телефоне адрес [ifconfig.co](https://ifconfig.co) чтобы узнать внешний IP адрес VPN'а. Запоминаем этот адрес

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