---
layout: post
title: Vaultwarden - свой сервер для Bitwarden клиента
tags: MacOS
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/vaultwarden/logo.png)

### Предыстория

Давно уже не помню пароли для своих сервисов. И помог мне в этом освобождении памяти — Bitwarden. [Битводен](https://bitwarden.com/) – это многофункциональный с открытым исходным кодом, менеджер паролей. 

Из плюсов этого решения: 

- кроссплатформенность: МакОсь, Виндовс, Линукс, айОС, Андройд, екстешены для браузеров, и даже консольный клиент
- интеграции с [рейкастом](https://www.raycast.com/) и [Альфредом](https://www.alfredapp.com/)
- 2х факторка и для него и внутри можно TOTP хранить
- автозаполнение форм
- генерация паролей по правилам
- шаринг паролей
- сохранение данный платежных карт
- не тошнит от интерфейса клиента

Создание базового аккаунта битводен является бесплатным на их серверах и даже за подписку можно больше фич, но можно самостоятельно разместить и свой сервер, но официальный сервер говорят подтормаживает, да и еще надо вагонить майкрософт эс ку эль сервер, да и не будет всех "платных" фич. Да и времена сейчас такие, что лучше иметь все свое и при себе. 

Поэтому навел резкость, своих прекрасных глаз на такое решение как [vaultwarden](https://github.com/dani-garcia/vaultwarden?tab=readme-ov-file) 

Ваултводен — ранее известный как "Bitwarden_RS", написан на языке Rust и использует Sqlite в качестве базы данных. и обрантно совместим с Bitwarden API. 

### Как будем разворачивать ? 

Нам нужно: 

- Домен, чтобы был SSl
- Сервер (свой или VPS)
- Docker с docker-compose 
- [Caddy](https://caddyserver.com/)

Что такое випиэска и докеры\шмокеры знает почти каждый, немного расскажу про [кэдди](https://timeweb.cloud/tutorials/servers/caddy-prostoj-i-legkij-reverse-proxy). 

Очень часто, в последнее время, все больше использую его для простой раздачи статики или для проксирования. Очень лаконичные конфиги получаются и SSL делается в разы проще и автоматически. Честно для дома для семьи почти заменил энджинкс. 

#### Настраиваем домен

На вашем операторе доменных имен добавляете A запись для вашего домена, которая ведет на ваш сервер.

#### Ставим docker-compose

Ставим, если еще нет. На убунту делается так:

<code>
apt install docker.io docker-compose
</code>

#### Создаем docker-compose.yml файл

Делаем стильно, модно и микросервисно. Поднимаем ваултводен сразу вместе с кэдди. 

Создаем docker-compose.yml в удобном вам месте в любимом вашем текстовом редакторе с таким содержимым: 

<code>
version: "3"
services:
  vaultwarden:
    image: vaultwarden/server:latest
    container_name: vaultwarden
    restart: always
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /srv/vaultwarden:/data
  caddy:
    image: caddy:2
    container_name: caddy
    restart: always
    ports:
      - 80:80
      - 443:443
    volumes:
      - /srv/caddy/Caddyfile:/etc/caddy/Caddyfile:ro
      - /srv/caddy/config:/config
      - /srv/caddy/data:/data
      - /srv/caddy/logs:/logs
    environment:
      DOMAIN: "<yourdomain>"
      EMAIL: "<youremail>"
      LOG_FILE: /srv/caddy/logs/access.log
</code>

Где  DOMAIN и EMAIL вам надо заполнить, для выпуска сертификата. Указываем например так: DOMAIN: "notbitwarden.tatar.beaver" и EMAIL: "noreplay@tatar.beaver"


##### Немного поясню 

Первый сервис, это и есть “vaultwarden”, он основан на последнем образе vaultwarden/server. Имя ему не будем выдумывать и наречем его — vaultwarden. Также назначим ему рестарт - всегда. 

Также определили два монтирования (bind mounts):

- первый из этих файлов – /etc/localtime: это для проверки часового пояса и времени между контейнером и хостовой машиной

- каталог /data внутри контейнера с /srv/vaultwarden на хосте нужен для хранения базы данных и прочих кешей с аттачментами. Да и бекапить удобнее будет. 

Второй сервис это и есть сам кэдди. Из интересного для использования его в качестве реверс прокси и для работы его как ACME клиента для получения сертификата у Let’s Encrypt, мы также сопоставили порты 80 и 443 на хосте с теми же портами внутри контейнера. Тут мудрить не стал особо. 

Мы определили четыре "монтирования": с помощью первой мы привязали файл /etc/caddy/CaddyFile - это основной конфиг. Остальное - "системное" и логи.

#### Создаем Caddyfile

Создаем папку: 

<code>
sudo mkdir /srv/caddy
<code>

создаем Caddyfile в вашем любимом текстовом редакторе: 

<code>
vim /srv/caddy/Caddyfile
<code>

с таким содержимым: 

<code>
{$DOMAIN}:443 {
  log {
    output file {$LOG_FILE} {
      roll_size 10MB
      roll_keep 10
    }
  }
  tls {$EMAIL}
  reverse_proxy /notifications/hub vaultwarden:3012
  reverse_proxy vaultwarden:80 {
    header_up X-Real-IP {remote_host}
  }
}
<code>


##### Немного поясню 

- {$DOMAIN} и {$EMAIL} возмется из docker-compose.yml 

- Сделали логи цикличным и не очень большими и в правильное место их пишем в виде файла.

- reverse_proxy. У него синтаксис простой:

reverse_proxy [чо][куда]: 

— "Чо" используется для ограничения применения. Мы использовали путь, начинающийся со /: запрос будет обработан только при его совпадении.

"Куда" - это адрес, на который должен быть перенаправлен запрос. Т.е мы перенаправляем запросы с путем /notifications/hub в “vaultwarden” на порт 3012 (“vaultwarden” – это имя сервиса и имя хоста, которое мы определили в файле docker-compose.yml, а все остальное – в порт 80.

- header_up в нем мы ставим “{remote_host}” в “X-Real-IP”

#### Запускаем 

- в каталоге где у нас лежит docker-compose.yml выполняем:

<code>
sudo docker-compose up -d
<code>

- ждем

— проверяем что все работает, выполняем: 

<code>
sudo docker ps
<code>

В ответе будут наши контейнерны с именами: caddy и vaultwarden


Теперь открываем в браузере домен который вы указали ранее и выполняем регистрацию новой учетной записи. В клиентах битводен для ваших ОС указываем его как URL для self-hosted системы.

### Вы супер!