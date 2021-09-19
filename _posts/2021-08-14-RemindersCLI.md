---
layout: post
title: reminders-cli
---
Да, и снова CLI утилита. Люблю я консоль. Решил попользоваться утилитой для добавления заметок в программу iOS Reminders, чтобы напоминания были под рукой на телефоне и планшете. А добавлять иногда хочется напоминания через консоль, так как можно автотизировать создание заметки в скриптах.

## Установка
<code>brew install keith/formulae/reminders-cli</code>

## Использование

- Показать список напоминаний

<code>
reminders show-lists
</code>

- Пример

<code>
❯ reminders show-lists
Tasks
Work
Family
</code>

- Показать напомниние в определенном списке

<code>reminders show <list-name></code>

- Пример

<code>
❯ reminders show Tasks
0: Написать о reminders-cli
</code>

- Добавить новое напомниние 

<code>reminders add <list-name> [<reminder> ...] [--due-date <due-date></code>

- Пример

<code>
❯ reminders add Tasks Проверить работу добавление заметок -d "today 11am"
Added 'Проверить работу добавление заметок' to 'Tasks'
</code>

- Отметить задание выполненным

<code>reminders complete <list-name> <index></code>

Пример

<code>
❯ reminders complete Tasks 1
Completed 'Проверить работу добавление заметок'
</code>

### Лайфхаки

Добавил себе alias'ы для быстрого добавления задач в список Tasks, просмотр задач из списка Tasks и чтобы быстро отметить что выполненил задачу в списке Tasks

<code>
alias radd="reminders add Tasks"
alias rshow="reminders show Tasks"
alias rcomp="reminders complete Tasks"
</code>

Теперь работать со списком задач в Tasks станет проще. Всего три комманды: <code>radd</code> <code>rshow</code> <code>rcomp</code>
