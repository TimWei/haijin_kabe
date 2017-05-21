class Source
	@@main_host = ''
	@@ranking = ''
	@@url_pattern = ''

	def initialize
		@save_path = ''
		@download_number = 0
		@agent = Mechanize.new { |agent|
		  agent.user_agent_alias = 'Mac Safari'
		}
		
	end

	def get_daily number
		p_try 'get daily illust id'
		@download_number = number
		@download_number = 50 if number > 50
	end

	def download path = nil 
		p_try 'downloading'
		@save_path = path || "./img/"
	end

	private
	def p_try s
		puts '=================='
		puts 'Trying ' + s + ' :'
	end
end