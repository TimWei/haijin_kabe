class PixivMoe < Source
	def initialize
		super
		@illus_urls = []
	@@main_host  = 'https://api.pixiv.moe/'
	@@ranking = 'v1/ranking'
	@@url_pattern = /large":"(https:.\/.\/api\.pixiv\.moe.\/v[0-9].\/image.\/[a-zA-Z0-9]*==)/
	end

	def get_daily number
		super
		@agent.get(@@main_host + @@ranking) do |page|
			@illus_urls = page.body.scan(	@@url_pattern ).map{|t| t[0]}
			@illus_urls = @illus_urls.sample @download_number
		end
		@illus_urls.empty? ? p('Failed') : p('Success')
		download
	end

	def download path = nil 		
		super
		@illus_urls.each do |url|
			p "download ~> #{url} at #{@save_path}"
			file_name = url.split('/')[-1]
			url.gsub! '\\',''
			@agent.get(url).save(@save_path + file_name + '.jpg')
		end
	end
end