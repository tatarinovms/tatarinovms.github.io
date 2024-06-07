---
layout: post
title: Wireguard c WebUI
tags: MacOS
---
![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/WireGuard/logo2.png)

### Про что пост?

Ранее дававал скрипт для простой установки Wireguard на [сервер](https://blog.tatarinov.space/wireguardVPNScript/), но теперь я хочу вам рассказать о том, как сделать WireGuard удобнее. 

### Как делать? 

- eсли нет докера - ставим. В Ubuntu делается легко:

```
apt install docker.io
```

- запускаем наш контейнер, только укажем пару нужных нам параметров: WG_HOST и PASSWORD

```

docker run -d \
  --name=wg-easy \
  -e WG_HOST=ваш IP \
  -e PASSWORD=ваш пароль к вебморде \
  -v ~/.wg-easy:/etc/wireguard \
  -p 51820:51820/udp \
  -p 51821:51821/tcp \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --sysctl="net.ipv4.ip_forward=1" \
  --restart unless-stopped \
  weejewel/wg-easy

```

- наша вебморда поднимается на порту 51821, т.е чтобы ее открыть в браузере пишем "IP вашей виртуалки:port" и пишем пароль, который мы указали при старте docker контейнера.

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/WireGuard/1.png)

### Что можно делать в вебморде?

— добавлять клиентов, видеть онлайн они или нет, видеть их скорость. Самая удобная фича: включать\выключать клиента.

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/WireGuard/2.png)

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/WireGuard/3.png) 

— удалять профиль

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/WireGuard/1.png)

— скачивать конфиг клиента и показывать QR код

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/WireGuard/5.png)

![](https://raw.githubusercontent.com/tatarinovms/tatarinovms.github.io/master/images/posts/WireGuard/6.png)

- редактировать описание и IP 

