# Line Bot Sample in Rails x Heroku

This repository was created using this article as reference.

http://qiita.com/Arahabica/items/98e3d0d5b65269386dc4


# Setup

## Clone this repository.

```
git clone https://github.com/hanzochang/linebot-sample.git
```

## Setup heroku

- If you dont have your heroku account, signup to heroku. https://signup.heroku.com/
- **And you must register your credit card at heroku**, because this sample use plugins. Using these needs registering your credit card number.


```
$ cd linebot-sample
$ heroku create YOUR-APP-NAME
```

see your heroku app -> https://dashboard.heroku.com/apps


## Setup ClearDB(heroku plugin)

This app use mysql, so regist `cleardb:ignite`.

```
$ heroku addons:create cleardb:ignite
```

config database_url protocol must be changed `mysql://` to `mysql2://`

```
$ heroku config | grep CLEARDB_DATABASE_URL
-> DATABASE_URL='mysql://******@*****.cleardb.net/*****?reconnect=true'
$ heroku config:set DATABASE_URL='mysql2://******@*****.cleardb.net/*****?reconnect=true'
```

## Deploy to heroku

```
$ git push heroku master
```

Create&Migrate DB

```
heroku run rake db:create 
heroku run rake db:migrate
```

## Setup Fixie(heroku plugin) for using Static IP

Fixie is the proxy to allow app to use Static IP.
LineBot needs Server IP Whitelist, if you dont use the fixie, you'll input the new ip deploying each time, so I recommended you to use Fixie.

Execute below.

```
$ heroku addons:create fixie:tricycle
```

Access your heroku app dashboard, click `fixie`.

![heroku](http://i.imgur.com/93b2ux9.png "linebot")

And Click `Account` in header menu, then it will display `Static IPs` and `Proxy URL`. 
Please write it down.

![fixie](http://i.imgur.com/ac02Iba.png "fixie")


## Regiser your static ip(in fixie) to LineBot.

- Access https://developers.line.me/, and move `channel -> Server IP Whitelists`.
- Register your Static IP in its page.

![linebot](http://i.imgur.com/s7XzwO1.png "linebot")


## Register CallBack URL to Static IP

- Access your linebot channel.
- And Edit your CallBack URL.  `ex. https://****.herokuapp.com:443/callback`

![linebot](http://i.imgur.com/RpF43fH.png "linebot")


## Configure your LINEBOT API KEYS to heroku as ENV.

Execute below.

```
$ heroku config:add LINE_CHANNEL_ID="XXXXXXXXXXXX" // Your Channel ID
$ heroku config:add LINE_CHANNEL_SECRET="XXXXXXXXXXXX" // Your Channel Secret Key
$ heroku config:add LINE_CHANNEL_MID="XXXXXXXXXXXX" // Your Channel MID
$ heroku config:add LINE_OUTBOUND_PROXY="XXXXXXXXXXXX" // Fixie Proxy URL
```

# Follow and Message to your Linebot.

- Access your linebot channel's page, and by Line App in your smartphone, read QR Code.
- Post the message to it.
- It'll response repeating your words.

# Reference

- http://qiita.com/Arahabica/items/98e3d0d5b65269386dc4


