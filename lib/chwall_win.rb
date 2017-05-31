require 'Win32API'

SPI_SETDESKWALLPAPER = 20
SPIF_SENDCHANGE = 0x2
SOURCE_FOLDER = Dir.pwd + '/img/'
remain_images = 0
file = ''

def change_wall
	files = Dir.entries(SOURCE_FOLDER) - [".", ".."]
	remain_images = files.length
	file = SOURCE_FOLDER + files[rand(remain_images)]
	systemParametersInfo = Win32API.new("user32","SystemParametersInfo",["I", "I", "P", "I"],"I")
	p systemParametersInfo.call(SPI_SETDESKWALLPAPER, 1, file, SPIF_SENDCHANGE)
end

def internet_avalable?
	false
end

def rm_file 
	if file.match /\.(jpg|png)$/
		`del #{file}`
	end
end

def main
	change_wall
	if internet_available?
		if remain_images == 0
			p 'no files'
		else
			rm_file
		end
	end
end

main