---
layout: post
title: Создание вашей визитки в NFC Tag
---
Увидел рекламу сервиса в сториз инстаграм, который продает клейкую NFC метку со ссылкой на вашу анкету и якобы она упростит  способом делится вашим контактом с пользователями. Они просто сканируют вашу метку и вуаля..такая вот визитка 21ого века.

Технически сервис работает просто - вы заполняете ваши контакты, они формируют About страницу с вашими данными, записывают URL адрес данной страницы в NFC метку, присылыют вам ее, вы наклеиваете его на телефон/чехол и профит. На данном сайте есть ссылки в формате tel:, mailto:, вашей аватаркой и ссылкой на контакт и т.д

Но это слишком топорно, давайте сделаем дешевле, практичнее и гибче. 

P.S Конечно в NFC метку можно записать и контакт сразу, но это не так информативно, так как возможных полей будет меньше. 

### Начинаем

- Создаем страницу с вашими контактами и ссылками на ресурсы где вас можно найти. Например как моя about [страница](https://blog.tatarinovms.ru/about)
- Покупаем на Ali самые дешевые перезаписываемые метки (можно  "одноразовые", так даже дешевле выйдет). Я брал [такие](https://aliexpress.ru/item/4000481520248.html)

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/vcard/vlenta.png)

- Создаем vCard для удобства добавления вас в справочник. Можно воспользоваться экспортом из приложения Contacts на MacOS или сделать vCard на [сайте](https://vcardmaker.com), сделать экспорт из GMail, способов много, даже взять стандарт [vCard](https://tools.ietf.org/pdf/rfc6350.pdf) и заполним все поля вручную.

P.S Если делаете файл аватарки в Base64, то конвертируем нашу аватарку в можно на сайте [base64-image.de](https://www.base64-image.de)
- Сохраняем наш файл как name.vcf и размещаем его и добавляем ссылку на вашу about страницу
### Записываем данные на метки 

Для iPhone использую утилиту [NFC Tools](https://apps.apple.com/us/app/nfc-tools/id1252962749)
- Для метки на нашу about страничку:

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/vcard/write_about.png)

- Для метки c ссылкой на vCard:

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/vcard/write_vcard.png)


### Проверяем работу
- Сканируем по очереди метки

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/vcard/vcard_link.png)

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/vcard/vcard_link_1.png)

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/vcard/about_link.png)

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/vcard/about_link_1.png)


- Приклеиваем метки на чехол/телефон/визитку
- PROFFIT!