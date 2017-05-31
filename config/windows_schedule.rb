require 'rufus-scheduler'
require 'tzinfo/data'

path = Dir.pwd 

# rescraping images hourly
`schtasks /Create /TN haijin_kabe_get /SC HOURLY /MO 1 /TR "ruby #{path}/lib/kabe.rb"`

#change wallpaper 15 mins
`schtasks /Create /TN haijin_kabe_change /SC MINUTE /MO 15 /TR "ruby #{path}/lib/chwall_win.rb"`
