# STM32-Blink

Nucleo 303K8 をベアメタルから動かし、L チカするためのコードです。

Qiita に解説記事があります。

[L チカ! STM32 Nucleo で BareMetal 超入門!!!🔥](https://qiita.com/YuseiIto/items/8ab5ba177cb5924b3174)

記事中で解説していない、build_flash.sh というファイルがありますが、これはビルド&書き込みを行うスクリプトです。
記事で書いているコマンド操作をバッチ化しているので、合わせてご利用下さい。

```zsh
$ sh build_flash.sh
```
