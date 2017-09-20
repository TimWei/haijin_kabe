# Haijin-Kabe 廢人壁
> 給二次元黨的開發者們

其他語言版本: [English](https://github.com/TimWei/haijin_kabe/blob/master/README.en-us.md)

## 簡介
身為二次元黨，總是不斷的更換壁紙，於是做了個更換壁紙的排程腳本，目前支援OSX與Windows版本．

## 特色
- Ruby ftw
- 可擴充圖源網站
- 使用Ruby介面管理Crontab計畫任務 ([Whenever](https://github.com/javan/whenever))
- 抓取圖片數據以及用戶驗證 ([Mechanize](https://github.com/sparklemotion/mechanize))
- 自動判斷作業系統 ([os](https://github.com/rdp/os))
- 週期性從[Pixiv Rank](http://www.pixiv.net/ranking.php?mode=daily&content=illust)或其它第三方API隨機抓取圖片做為桌面壁紙

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
# 可選擇從Pixiv官網或第三方源如 pixiv.moe作為圖源
# -'//pixiv.moe'
# -'//pixiv.net'
source: '//pixiv.moe'

# 當選擇從Pixiv官網作為圖源时，需要Pixiv用戶信息作為用戶驗證，否則將返回403錯
pixiv:
  account: 
  password: 

#抓取圖片與更換壁紙的頻率
#分鐘
frequency:
  #切換壁紙的週期(分鐘)
  change_wallpapper: 15
  #收集壁紙的週期(分鐘)
  download_new_image: 60

```

2. 於解壓縮目錄下，執行初始化
```
bundle install
```
```
ruby init.rb
```

3. 調整背景(Optional)
於[調整桌面背景]中將壁紙放置方式改為[符合螢幕大小]

