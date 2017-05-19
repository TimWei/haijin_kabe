# Haijin-Kabe 廢人壁
> 獻給二次元黨的開發者們

## 簡介
身為二次元黨，總是不斷的更換壁紙，於是做了個更換壁紙的排程腳本，初期版本提供OSX上運行；未來也計畫加入其他作業系統．

## 特色
- Ruby ftw
- [Whenever](https://github.com/javan/whenever)套件管理crontab，易於維護與更改排程計畫
- [Mechanize](https://github.com/sparklemotion/mechanize)抓取圖片數據以及登入
- 週期性從[Pixiv Rank](http://www.pixiv.net/ranking.php?mode=daily&content=illust)隨機抓取桌布使用

## 倉庫
[Github](https://github.com/TimWei/haijin_kabe)

## 如何部署
### 依賴
- Ruby (建議2.0.0以上)
- Bundler
- Pixiv用戶帳號

### 安裝
1. 解壓縮目錄後，使用文字編輯器打開目錄下名為user.yaml檔案，將預計用於抓取圖片的Pixiv用戶名及密碼輸入像以下
```yaml
pixiv:
  account: 'your.pixiv@account.here'
  password: 'your pixiv password'
```

2. 於解壓縮目錄下，執行安裝
```
ruby init.rb
```

3. 安裝完畢後，執行排程計畫
```
whenever --update-crontab
```

4. 調整背景(Optional)
於[調整桌面背景]中將壁紙放置方式改為[符合螢幕大小]

