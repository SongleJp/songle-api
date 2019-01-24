# Songle API

## Songle API とは

[能動的音楽鑑賞サービス Songle （ソングル）](//songle.jp)の機能や解析結果をあなたのアプリケーションから利用することができるアプリケーション開発者向け API です。 [Songle API](//api.songle.jp) の提供する機能を組み合わせることで、ウェブ上の好きな音楽の再生に合わせて動作するアプリケーションを容易に開発することができます。[大規模音楽連動制御プラットフォーム Songle Sync （ソングルシンク）](//api.songle.jp/sync)の機能を使う場合も、こちらをご利用ください。

## [ドキュメント](//api.songle.jp/quickstart/javascript)

詳細な使い方は [api.songle.jp](//api.songle.jp/quickstart/javascript) よりご確認ください。

## クイックスタート

### 動作要件

Songle API モジュールは、次の環境で動作することが確認されています。

#### ブラウザ

- Microsoft Edge 17
- Mozilla Firefox 62
- Google Chrome 70
- Safari 12
- Opera 55
- Android Browser 67
- iOS Safari 11.4
- Google Chrome for Android 69

#### Node.js

- 8.x
- 9.x
- 10.x

### インストール

#### ブラウザ

Songle API モジュールは `script` タグもしくは `npm` などのパッケージマネージャからインストールすることができます。

```html
<script src="https://api.songle.jp/v2/api.js"></script>
```

#### npm

```sh
$ npm install songle-api
```

### Hello, Songle API !!

ウェブブラウザから Songle API モジュールを利用した場合、その利用準備の完了を通知する `onSongleAPIReady` が Songle API モジュールによって自動的に呼び出されます。

```javascript
self.onSongleAPIReady =
  function(Songle) {
    alert("Hello Songle API !!");
  }
```

### サンプルプログラム

次のサンプルプログラムは、音楽の拍子と連動するプログラムです。サンプルからも分かるように、音楽に連動したイベント駆動のプログラムを容易に記述することができます。

#### サンプルプログラム１

```javascript
self.onSongleAPIReady =
  function(Songle) {
    var player =
      new Songle.Player({
        mediaElement: "#songle"
      });

    player.addPlugin(new Songle.Plugin.Beat());
    player.useMedia("https://www.youtube.com/watch?v=zweVJrnE1uY");

    player.on("beatPlay",
      function(ev) {
        switch(ev.data.beat.position) {
          case 1:
            console.log("1st beat !!");
            break;

          case 2:
            console.log("2nd beat !!");
            break;

          case 3:
            console.log("3rd beat !!")
            break;

          case 4:
            console.log("4th beat !!");
            break;
        }
      });
  }
```

### Songle Sync の使い方

#### Songle Sync （ソングルシンク）とは

ウェブ上の音楽の再生に合わせて多種多様な機器を同時制御することで、一体感のある演出ができる[大規模音楽連動制御プラットフォーム](//api.songle.jp/sync)です。誰でも自分のスマートフォンやパソコン等の機器を自由自在に組み合わせて、好きな楽曲の再生に合わせて光ったり動いたりする演出を作ることができます。

#### はじめに

この機能を使うためには [Songle API のウェブサイト](//api.songle.jp)から[ユーザ登録](//api.songle.jp/user/entry)を行い、トークンを取得する必要があります。取得方法の詳細は[チュートリアルのステップ３](//tutorial.songle.jp/sync/step3)を参照してください。

#### [チュートリアル](//tutorial.songle.jp)

[チュートリアルサイト](//tutorial.songle.jp)では、より実践的な使い方を実際に体験しながら学ぶことができます。チュートリアルの内容は、アプリケーション開発者をメインターゲットとしていますが、途中までは、プログラミングの知識がない方でもより高度な大規模音楽連動制御を楽しみながら体験できます。

#### サンプルプログラム２

次のサンプルプログラムは、サンプルプログラム１を大規模音楽連動制御に対応させたプログラムです。取得したトークンを記述して複数のブラウザからマスターとスレーブを実行してみて、イメージを掴んでみましょう。

##### ウェブブラウザ / マスター

```javascript
self.onSongleAPIReady =
  function(Songle) {
    var player =
      new Songle.SyncPlayer({
        accessToken: "YOUR-ACCESS-TOKEN-HERE", // Please edit your access token
        secretToken: "YOUR-SECRET-TOKEN-HERE", // Please edit your secret token
        mediaElement: "#songle"
      });

    player.addPlugin(new Songle.Plugin.Beat());
    player.useMedia("https://www.youtube.com/watch?v=zweVJrnE1uY");

    player.on("beatPlay",
      function(ev) {
        switch(ev.data.beat.position) {
          case 1:
            console.log("1st beat !!");
            break;

          case 2:
            console.log("2nd beat !!");
            break;

          case 3:
            console.log("3rd beat !!")
            break;

          case 4:
            console.log("4th beat !!");
            break;
        }
      });
  }
```

##### ウェブブラウザ / スレーブ

```javascript
self.onSongleAPIReady =
  function(Songle) {
    var player =
      new Songle.SyncPlayer({
        accessToken: "YOUR-ACCESS-TOKEN-HERE", // Please edit your access token
        mediaElement: "#songle"
      });

    player.addPlugin(new Songle.Plugin.Beat());
    player.useMedia("https://www.youtube.com/watch?v=zweVJrnE1uY");

    player.on("beatPlay",
      function(ev) {
        switch(ev.data.beat.position) {
          case 1:
            console.log("1st beat !!");
            break;

          case 2:
            console.log("2nd beat !!");
            break;

          case 3:
            console.log("3rd beat !!")
            break;

          case 4:
            console.log("4th beat !!");
            break;
        }
      });
  }
```

##### Node.js / スレーブ

次のサンプルプログラムは Node.js 上で動作するスレーブのサンプルです。

```javascript
var Songle = require("songle-api");

var player =
  new Songle.SyncPlayer({
    accessToken: "YOUR-ACCESS-TOKEN-HERE", // please edit your access token
  });

player.addPlugin(new Songle.Plugin.Beat());

player.on("beatPlay",
  function(ev) {
    switch(ev.data.beat.position) {
      case 1:
        console.log("1st beat !!");
        break;

      case 2:
        console.log("2nd beat !!");
        break;

      case 3:
        console.log("3rd beat !!")
        break;

      case 4:
        console.log("4th beat !!");
        break;
    }
  });
```

#### より詳細なサンプルプログラム

- [Songle Sync master/slave using browser example](//github.com/SongleJp/songle-sync-app-browser)
- [Songle Sync slave using Intel Edison example](//github.com/SongleJp/songle-sync-app-edison)
- [Songle Sync slave using Node.js example](//github.com/SongleJp/songle-sync-app-nodejs)
- [Songle Sync slave using Rapiro example](//github.com/SongleJp/songle-sync-app-rapiro)
- [Songle Sync slave using Raspberry Pi example](//github.com/SongleJp/songle-sync-app-pi)
- [Songle Sync slave using Webmo example](//github.com/SongleJp/songle-sync-app-webmo)

## ライセンス

Songle API を利用するためには、[利用規約](//api.songle.jp/policies/terms.pdf)に同意する必要があります。

---
Copyright (c) 2017-2019 AIST Songle Project
