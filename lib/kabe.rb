require 'yaml'
require 'open-uri'
require 'json'
require 'mechanize'
require 'uri'
require 'os'
require_relative 'source'
require_relative 'source/pixiv'
require_relative 'source/third_party_api'
require_relative 'helper'

begin
	Helper.clear_old_img
	setting = Helper.load_setting 
	source = URI.parse(setting['source']).host
	freq = setting['frequency']
	pic_num = (freq['download_new_image'] / freq['change_wallpapper']) + 1
	case source
	when 'pixiv.net'
		pixiv_info = setting['pixiv']
		ag = Pixiv.new
		ag.login pixiv_info['account'], pixiv_info['password']
		ag.get_daily pic_num
	when 'pixiv.moe'
		ag = ThirdPartyApi.new host_name: 'https://api.pixiv.moe/', path: 'v2/ranking', url_pattern: /large":"(https:.\/.\/api\.pixiv\.moe.\/v[0-9].\/image.\/[a-zA-Z0-9]*=)/
		ag.get_daily pic_num
	when 'imjad.cn'
		ag = ThirdPartyApi.new referer: 'https://pixiv.net/', host_name: 'https://api.imjad.cn/', path: 'pixiv/v1/?type=rank&mode=daily&content=illust', url_pattern: /large":"(https:.\/.\/i2\.pixiv\.net.\/img-original.\/img.\/([0-9]*.\/){6}[0-9]*(_p[0-9])?\.(jpg|png))/
		ag.get_daily pic_num
	end

rescue => e
	puts e.message
end