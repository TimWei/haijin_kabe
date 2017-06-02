PATH = Dir.pwd 
HIDE_WIN = PATH + '/lib/hidewin.vbs'

def remove_old_sche
	`schtasks /delete /TN haijin_kabe_get /f >NUL 2>&1`
	`schtasks /delete /TN haijin_kabe_change /f >NUL 2>&1`
end

def new_sche
	# rescraping images hourly
	`schtasks /create /TN haijin_kabe_get /SC HOURLY /MO 1 /TR "#{HIDE_WIN} ruby #{PATH}/lib/kabe.rb " `
	#change wallpaper 15 mins
	`schtasks /create /TN haijin_kabe_change /SC MINUTE /MO 15 /TR "#{HIDE_WIN} ruby #{PATH}/lib/chwall_win.rb" `
end

remove_old_sche
new_sche
