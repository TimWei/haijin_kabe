class Pixiv < Source
	CDN_HOST = 'https://i.pximg.net/'
	ORIGIN_IMG = '/img-original/img/'

	def initialize opt={}
		super
		@post_key = ''
		@illus_ids = []
		@main_host  = 'https://www.pixiv.net/'
		@ranking = 'ranking.php?mode=daily&content=illust'
		@url_pattern = /https:\/\/i.pximg.net\/c\/240x480\/img-master\/img\/(([0-9]|\/)+_p[0-9])((_|[a-z]|[0-9])*)?(\.[a-z]{3})/

		@auth_host = "https://accounts.pixiv.net/"
		@login_csrf = 'signup?lang=zh_tw&source=pc&view_type=page&ref=wwwtop_accounts_index'
		@login_post = 'api/login'

		get_post_key
		login opt[:account], opt[:password]
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
			'Referer' => @main_host
		}
		
		res = @agent.post(@auth_host + @login_post,form, headers)
		res_json = JSON.parse(res.body)
		if res_json['error'] == false
			p 'Success: logined'
		else
			p res_json.body['message']
			p 'Failed'
		end
	end

	def get_daily number
		super 
		@agent.get(@main_host + @ranking) do |page|
			@illus_ids = (page.body.scan(	@url_pattern ).map{|t| t[0] + t[4]}.uniq - [""])
			@illus_ids = @illus_ids.sample @download_number
		end
		@illus_ids.empty? ? p('Failed') : p('Success')
		download
	end

	def download path = nil 
		super
		@illus_ids.each do |id|
			p "download ~> #{id} at #{@save_path}"
			file_name = id.gsub '/','_'
			begin
				@agent.get(CDN_HOST + ORIGIN_IMG + id,[], @main_host).save(@save_path + file_name)
			rescue
				begin
					png_id = id[0..-4] + 'png'
					file_name = id.gsub '/','_'
					@agent.get(CDN_HOST + ORIGIN_IMG + png_id,[], @main_host).save(@save_path  + file_name)
				rescue
					next
				end
			end
		end
	end
	def get_post_key
		p_try 'get post_key'
		@agent.get(@auth_host + @login_csrf) do |page|
			@post_key = page.body.match(/postKey\":\"([a-zA-Z0-9]+)\"/)[1]
			p "Success: post key: #{@post_key}"
		end
	end
end