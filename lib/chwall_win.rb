require 'Win32API'
require 'pry'
require 'open-uri'

SPI_SETDESKWALLPAPER = 20
SPIF_SENDCHANGE = 0x2
SOURCE_FOLDER = File.dirname(__FILE__) + '/../img/'
@remain_images = 0
@file = ''

def change_wall
	files = Dir.entries(SOURCE_FOLDER) - [".", ".."]
	@remain_images = files.length
	@file = files[rand(@remain_images)]
	systemParametersInfo = Win32API.new("user32","SystemParametersInfo",["I", "I", "P", "I"],"I")
	p systemParametersInfo.call(SPI_SETDESKWALLPAPER, 1, SOURCE_FOLDER + @file, SPIF_SENDCHANGE)
end

def internet_available?
  begin
    true if open("http://www.google.com/")
  rescue
    false
  end
end

def rm_file 
	if @file.match /\.(jpg|png)$/
		Dir.chdir SOURCE_FOLDER
		`del "#{@file}"`
	end
end

def main
	change_wall
	if internet_available?
		if @remain_images == 0
			p 'no files'
		else
			rm_file
		end
	end
end

begin
	main
rescue => e
	binding.pry
end