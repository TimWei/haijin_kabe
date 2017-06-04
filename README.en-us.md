# Haijin-Kabe: Japanese Comics Wallpapers
> To All Anime Nerds.

Read this in other languages: 正體中文(https://github.com/TimWei/haijin_kabe/blob/master/README.md)

## Introduction
Haijin-Kabe is a light, automatic and cross-platform (currently OSX & Windows) wallpaper changer. As a citizen of Manga World, the only thing that is constant is--changing wallpaper.

## Features
- Ruby ftw
- Images Resource Expandability
- [Whenever](https://github.com/javan/whenever) Deploying and managing crontab
- [Mechanize](https://github.com/sparklemotion/mechanize) Drawling images from website and signing in
- [pry](https://github.com/pry/pry) Yet another shell for Ruby
- [os](https://github.com/rdp/os) If windows or not
- Randomly crawling images from [Pixiv Rank](http://www.pixiv.net/ranking.php?mode=daily&content=illust) as our wallpaper

## Repository
[Github](https://github.com/TimWei/haijin_kabe)

## How to deploy
### Dependency
- Ruby (>2.0.0) Windows user please visit [RubyInstaller](https://rubyinstaller.org/downloads/) for one-click installer.
- Bundler
- A Pixiv account(Optional)

### Installation and configuration
1. Download and extract the file. Edit the file "kabe_setting.yaml" under config folder, and set your image source website (default pixiv.moe). Will need your pixiv account and password if setting pixiv.net as source.
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

2. run commands under the repository you extract
```
bundle install
```
```
ruby init.rb
```

3. configure (Optional)
Go into "Desktop Backgrounds Settings" and set "Picture Position Option" to "Full"

