---
layout: post
title: Google Photo - удаление всех фото
tags: MacOS
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/GP/logo.png)


Как мы знаем сейчас не оплатить нормально Goolge аккаунт в РФ. Пришлось перехать на альтернативные места хранение фото и файлов. Решил удалить все фотографии накопленные годами в Google Photos, но есть НО...нет кнопки удалить все фото.
Удалить их можно только через браузер или мобильное приложение. Так причем в браузере имеется ограничение на выбор фотографии, удалить сразу более 500 штук нет возможности. Оффициальный ответ Google: "Выбирайте по 500 штук и удаляйте"

Но это как-то не по христиански, не наш путь...

## Что нам нужно?

### Переключить интерфейс Google Photos и браузера на английский язык

Если вы по каким-то причинам не используете английский язык в интерфейсах программ и ОС, то необходимо переключиться на английский.

- Переходим по адресу https://myaccount.google.com/language и делаем основным языком (PREFERRED LANGUAGE) English

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/GP/lang.png)

- В браузере тоже выставляем Английский язык (настройки зависят от браузера) 

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/GP/lang2.png)

### Выполняем скрипт для удаления

- Открываем [Google Photos](https://photos.google.com) в браузере

- Запускаем консоль разработчика Command+Option+J на MacOS или Control+Shift+J на Win

- Копипастим скрипт представленный ниже в буфер обмена и вставляем его в секцию Console и нажимаем Enter


const maxImageCount = "ALL_PHOTOS";

// Selector for Images and buttons
const ELEMENT_SELECTORS = {
    checkboxClass: '.ckGgle',
    deleteButton: 'button[aria-label="Delete"]',
    languageAgnosticDeleteButton: 'div[data-delete-origin] > button',
    deleteButton: 'button[aria-label="Delete"]',
    confirmationButton: '#yDmH0d > div.llhEMd.iWO5td > div > div.g3VIld.V639qd.bvQPzd.oEOLpc.Up8vH.J9Nfi.A9Uzve.iWO5td > div.XfpsVe.J9fJmf > button.VfPpkd-LgbsSe.VfPpkd-LgbsSe-OWXEXe-k8QpJ.nCP5yc.kHssdc.HvOprf'
}

// Time Configuration (in milliseconds)
const TIME_CONFIG = {
    delete_cycle: 10000,
    press_button_delay: 300
};

const MAX_RETRIES = 10;

let imageCount = 0;

let checkboxes;
let buttons = {
    deleteButton: null,
    confirmationButton: null
}

let deleteTask = setInterval(() => {
    let attemptCount = 1;

    do {
        checkboxes = document.querySelectorAll(ELEMENT_SELECTORS['checkboxClass']);

    } while (checkboxes.length <= 0 && attemptCount++ < MAX_RETRIES);


    if (checkboxes.length <= 0) {
        console.log("[INFO] No more images to delete.");
        clearInterval(deleteTask);
        console.log("[SUCCESS] Tool exited.");
        return;
    }

    imageCount += checkboxes.length;

    checkboxes.forEach((checkbox) => { checkbox.click() });
    console.log("[INFO] Deleting", checkboxes.length, "images");

    setTimeout(() => {
        try {
            buttons.deleteButton = document.querySelector(ELEMENT_SELECTORS['languageAgnosticDeleteButton']);
            buttons.deleteButton.click();
        } catch {
            buttons.deleteButton = document.querySelector(ELEMENT_SELECTORS['deleteButton']);
            buttons.deleteButton.click();
        }

        setTimeout(() => {
            buttons.confirmation_button = document.querySelector(ELEMENT_SELECTORS['confirmationButton']);
            buttons.confirmation_button.click();

            console.log(`[INFO] ${imageCount}/${maxImageCount} Deleted`);
            if (maxImageCount !== "ALL_PHOTOS" && imageCount >= parseInt(maxImageCount)) {
                console.log(`${imageCount} photos deleted as requested`);
                clearInterval(deleteTask);
                console.log("[SUCCESS] Tool exited.");
                return;
            }

        }, TIME_CONFIG['press_button_delay']);
    }, TIME_CONFIG['press_button_delay']);
}, TIME_CONFIG['delete_cycle']);


P.S скрипт честно взял [тут](https://github.com/mrishab/google-photos-delete-tool/blob/master/delete_photos.js) на ваше усмотрение можете отредактировать строчку 

<code>press_button_delay: 300 <code> можно поставить поменьше время, все зависит от того сколько вы готовы ждать появление кнопки "Move to trash" в моем случае я ставил 200. Время считается в миллисекундах. 

Если у вас очень много фото, то сделайте больше значение у параметра <code>delete_cycle<code>


![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/GP/script.png)

- Оставляем окно браузера в покое и ждем когда все фотки улетят в корзину

- У меня удаление всех фото заняло ~3 часа

