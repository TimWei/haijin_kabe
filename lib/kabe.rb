require 'yaml'
require 'open-uri'
require 'json'
require 'mechanize'
require 'pry'
require_relative 'source'
require_relative 'source/pixiv'
require_relative 'source/pixiv_moe'
require_relative 'helper'


Helper.clear_old_img
setting = Helper.load_setting 
source = setting['source']

case source
when 'pixiv'
	pixiv_info = setting['pixiv']
	ag = Pixiv.new
	ag.login pixiv_info['account'], pixiv_info['password']
	ag.get_daily 5
when 'pixiv_moe'
	ag = PixivMoe.new
	ag.get_daily 5
end

