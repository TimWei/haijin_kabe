require 'yaml'
require 'open-uri'
require 'json'
require 'mechanize'
require 'pry'
require 'uri'
require_relative 'source'
require_relative 'source/pixiv'
require_relative 'source/third_party_api'
require_relative 'helper'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
I_KNOW_THAT_OPENSSL_VERIFY_PEER_EQUALS_VERIFY_NONE_IS_WRONG = nil

Helper.clear_old_img
setting = Helper.load_setting 
source = URI.parse(setting['source']).host

case source
when 'pixiv.net'
	pixiv_info = setting['pixiv']
	ag = Pixiv.new
	ag.login pixiv_info['account'], pixiv_info['password']
	ag.get_daily 5
when 'pixiv.moe'
	ag = ThirdPartyApi.new host_name: 'https://api.pixiv.moe/', path: 'v1/ranking', url_pattern: /large":"(https:.\/.\/api\.pixiv\.moe.\/v[0-9].\/image.\/[a-zA-Z0-9]*==)/
	ag.get_daily 5
when 'imjad.cn'
	ag = ThirdPartyApi.new referer: 'https://pixiv.net/', host_name: 'https://api.imjad.cn/', path: 'pixiv/v1/?type=rank&mode=daily&content=illust', url_pattern: /large":"(https:.\/.\/i2\.pixiv\.net.\/img-original.\/img.\/([0-9]*.\/){6}[0-9]*(_p[0-9])?\.(jpg|png))/
	ag.get_daily 5
end

