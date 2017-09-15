require 'yaml'
PATH = Dir.pwd 
HIDE_WIN = PATH + '/lib/hidewin.vbs'
FREQ = YAML.load_file(File.dirname(__FILE__)+'/kabe_setting.yaml')['frequency']

def remove_old_sche
	`schtasks /delete /TN haijin_kabe_get /f >NUL 2>&1`
	`schtasks /delete /TN haijin_kabe_change /f >NUL 2>&1`
end

def new_sche
	# rescraping images hourly
	`schtasks /create /TN haijin_kabe_get /SC MINUTE /MO #{FREQ['download_new_image']} /TR "#{HIDE_WIN} ruby #{PATH}/lib/kabe.rb " `
	# change wallpaper 15 mins
	`schtasks /create /TN haijin_kabe_change /SC MINUTE /MO #{FREQ['change_wallpapper']} /TR "#{HIDE_WIN} ruby #{PATH}/lib/chwall_win.rb" `
end

remove_old_sche
new_sche
