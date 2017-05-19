require 'open-uri'
require 'json'
require 'mechanize'
class Pixiv
	MAIN_HOST = 'https://www.pixiv.net/'
	RANKING = 'ranking.php?mode=daily&content=illust'

	AUTH_HOST = "https://accounts.pixiv.net/"
	LOGIN_GET = 'signup?lang=zh_tw&source=pc&view_type=page&ref=wwwtop_accounts_index'
	LOGIN_POST = 'api/login'

	CDN_HOST = 'https://i.pximg.net/'
	ORIGIN_IMG = '/img-original/img/'

	def initialize
		@post_key = ''
		@illus_ids = []
		@agent = Mechanize.new { |agent|
		  agent.user_agent_alias = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36'
		}
		get_post_key
	end

	def login account, password
		p_try 'login'

		form = {
			post_key: @post_key,
			pixiv_id: account,
			password: password,
			captcha: '',
			ref: 'wwwtop_accounts_index',
			source: 'pc',
			return_to: "https%3A%2F%2Fwww.pixiv.net%2F",
			g_recaptcha_response: ''
		}
		
		headers = {
			'Content-Type' =>"application/x-www-form-urlencoded",
			'Referer' => MAIN_HOST
		}
		
		res = @agent.post(AUTH_HOST + LOGIN_POST,form, headers)
		res_json = JSON.parse(res.body)
		if res_json['error'] == false
			p 'Success: logined'
		else
			p res_json.body['message']
			p 'Failed'
		end
	end

	def get_daily number
		p_try 'get daily illust id'
		number = 50 if number > 50 
		@agent.get(MAIN_HOST + RANKING) do |page|
			@illus_ids = (page.body.scan(/https:\/\/i.pximg.net\/c\/240x480\/img-master\/img\/(([0-9]|\/)+_p[0-9])((_|[a-z]|[0-9])*)?(\.[a-z]{3})/).map{|t| t[0]+t[4]}.uniq - [""])
			@illus_ids = @illus_ids.sample number
		end
		@illus_ids.empty? ? p('Failed') : p('Success')
		download_daily
	end

	private

	def download_daily path = nil 
		p_try 'downloading'
		save_path = path || "./img/"
		@illus_ids[0..5].each do |id|
			p "download ~> #{id} at #{save_path}"
			file_name = id.gsub '/','_'
			begin
				@agent.get(CDN_HOST + ORIGIN_IMG + id,[], MAIN_HOST).save(save_path + file_name)
			rescue
				begin
					png_id = id[0..-4] + 'png'
					file_name = id.gsub '/','_'
					@agent.get(CDN_HOST + ORIGIN_IMG + png_id,[], MAIN_HOST).save(save_path + file_name)
				rescue
					next
				end
			end
		end
	end
	
	def get_post_key
		p_try 'get post_key'
		@agent.get(AUTH_HOST + LOGIN_GET) do |page|
		  @post_key = page.body.match(/postKey\":\"([a-zA-Z0-9]+)\"/)[1]
		  p "Success: post key: #{@post_key}"
		end
	end

	def p_try s
		puts '=================='
		puts 'Trying ' + s + ' :'
	end
end