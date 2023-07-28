# YouTube から素材の音を切り出す方法

## 1. YouTube から wav をダウンロードする

- yt-dlp を使う
- wav ファイルとしてダウンロードしないと Sonic Pi が読み込めない

コマンド

```
yt-dlp -x --audio-format wav 'youtube url'
```

## 2. wav を ffmpeg で指定した長さでカットする

コマンド

```
ffmpeg -i stream.wav -ss 5 -t 10 output.wav
```

- wav から 5 秒〜10 秒だけを抜き出している
