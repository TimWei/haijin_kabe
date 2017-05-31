# Haijin-Kabe 廢人壁
> 給二次元黨的開發者們

## 簡介
身為二次元黨，總是不斷的更換壁紙，於是做了個更換壁紙的排程腳本，目前支援OSX與Windows版本．

## 特色
- Ruby ftw
- 可擴充圖源網站
- [Whenever](https://github.com/javan/whenever)套件管理crontab，易於維護與更改排程計畫
- [Mechanize](https://github.com/sparklemotion/mechanize)抓取圖片數據以及登入
- 週期性從[Pixiv Rank](http://www.pixiv.net/ranking.php?mode=daily&content=illust)隨機抓取桌布使用

## 倉庫
[Github](https://github.com/TimWei/haijin_kabe)

## 如何部署
### 依賴
- Ruby (建議2.0.0以上) Windows用戶可在 [RubyInstaller](https://rubyinstaller.org/downloads/)找到一鍵安裝包
- Bundler
- Pixiv用戶帳號(Optional)

### 安裝與配置
1. 解壓縮目錄後，使用文字編輯器打開config目錄下名為kabe_setting.yaml檔案，設定圖源(預設為pixiv.moe)，如為pixiv則需要一併輸入pixiv用戶名與密碼
```yaml
# You can select pixiv or pixiv.moe by following value
# -'//pixiv.moe'
# -'//pixiv.net'
# -'//imjad.cn'
source: '//pixiv.moe'

# If you chose pixiv as image origin, downloading original image required auth or it'll returning 403 error 
pixiv:
  account: 
  password: 

```

2. 於解壓縮目錄下，執行初始化
```
ruby init.rb
```

3. 調整背景(Optional)
於[調整桌面背景]中將壁紙放置方式改為[符合螢幕大小]

