class ThirdPartyApi < Source
	def initialize opt={}
		super
		@main_host = opt[:host_name]
		@ranking = opt[:path]
		@url_pattern = opt[:url_pattern]
		@referer = opt[:referer]
		@illus_urls = []
	end

	def main_host=(host_name)
		@main_host = host_name
	end

	def get_daily number
		super
		@agent.get(@main_host + @ranking) do |page|
			@illus_urls = page.body.scan(	@url_pattern ).map{|t| t[0]}
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
		  file_name.gsub! /:|\/|\\|\.|\+|\~/, '_'
			url.gsub! '\\',''
			@agent.get(url, [], @referer).save(@save_path + file_name + '.jpg')
		end
	end
end