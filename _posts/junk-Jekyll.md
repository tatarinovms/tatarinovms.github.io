---
layout: post
title: Настройка Jekyll на GitHub Pages
---
https://frontender.info/build-blog-jekyll-github-pages/
Как вы видели мой блог немного поменялся. Увез я свой блог с хостинга и ушел с [CMS Эгея](https://blogengine.ru) претензии к Эгеи у меня нет, но давно руки чесались попробовать систему статической генерации сайтов. Держать хостинг ради одного блога смысла уже нет. Все что мне нужно хостить быстрее увести на свою VDS. 

## Как запустить блог на Jekkyll используя GitHub Pages
### Что такое Jekkyl?
	Для начала кратко расскажу что такое Jekkyl. Jekyll собирает ваш контент, который вы подготовили в [Markdown](https://en.wikipedia.org/wiki/Markdown) , применяет к нему ваш шаблон и генерирует полностью статический сайт, который у вас находится в вашем GitHub репозитарии, который автоматически доступен на GitHub Pages. Так что иметь хостинг свой вам не нужно.
	
Основные плюсы:
- просто текст в Markdown.
- отсутсвие базы данных 
- быстрая скорость работы
- минимализм
- версионность 
- возможность кастомизации

## Как развернуть Jekkyl?
Глобально есть два пути:
- установить локально  на своей машине Jekkyl. Создать новый сайт, сбилдить его и выложить. Т.е для создание сайта на базе Jekyll через CLI потребует от нас установить, настроить зави Ruby/RubyGems и так далее.
- форкнуть репозитарий с заготовкой поменять под себя и выложить его на GitHub Pages. Т.е пусть сам GitHub Pages собирает ваш сайт, если что пойдет не так, нам он сообщит.

	Идем простым путем. 
### Возьмем уже готовый репозитарий с заготовкой. 
- форкаем репозитарий 

