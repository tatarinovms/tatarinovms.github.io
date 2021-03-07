---
layout: post
title: Создание вашей визитки в NFC Tag
---
Увидел рекламу сервиса в сториз инстаграм, который продает клейкую NFC метку со ссылкой на вашу анкету и якобы она упростит  способом делится вашим контактом с пользователями. Они просто скандируют вашу метку и вуаля..такая вот визитка 21ого века.

Технически сервис работает просто - вы заполняете ваши контакты, они формируют About страницу с вами, записывают URL адрес данной страницы в NFC метку, присылыют вам ее, вы наклеиваете его на телефон/чехол и профит. На данном сайте есть ссылки в формате tel:, mailto:, вашей аватаркой и ссылкой на контакт.

Но это слишком топорно, давайте сделаем дешевле, практичнее и гибче. 

P.S Конечно в NFC метку можно записать и контакт сразу, но это не так информативно, так как возможных полей будет меньше. 

### Начинаем
- Создаем страницу с вашими контактами и ссылками на ресурсы где вас можно найти. Например как моя about [страница](https://blog.tatarinovms.ru/about)
- Покупаем на Ali самые дешевые перезаписываемые метки (можно  "одноразовые", так даже дешевле выйдет). Я брал [такие](https://aliexpress.ru/item/4000481520248.html)
<img src="{{ site.baseurl }}/posts/vcard/vlenta.png" style="height: 350px;"/>
- Создаем vCard для удобства добавления вас в справочник. Можно воспользоваться экспортом из приложения Contacts на MacOS или сделать vCard на [сайте](https://vcardmaker.com), сделать экспорт из GMail, способов много, но это слишком простой вариант, мы пойдём другим путем. Возьмем стандарт [vCard](https://tools.ietf.org/pdf/rfc6350.pdf) и заполним все поля сами! 
- Конвертируем нашу аватарку в base64, чтобы сразу ее положить в VCF файл. Можно конечно грузить по адресу, но так надежнее. Конвертировать можно на сайте [base64-image.de](https://www.base64-image.de)
- Открываем ваш любимый текстовый редактор и заполняем поля:
<img src="{{ site.baseurl }}/posts/vcard/vcard_code.png" style="height: 350px;"/>
- Записываем на метку 
- Приклеиваем метку на чехол 