puts 'Initializing...'
# require_relative 'lib/download'
require_relative 'cron/init_cronjob'

# if OS.windows?
#   puts 'preparing process for windows'
#   `ruby config/windows_schedule.rb`
  
# elsif OS.posix?
#   puts 'Avoiding windows newline crush'
#   `sed -i 's/\r$//' ./lib/chwall.sh`

#   puts 'Setting crontab...'
#   `whenever --update-crontab`
# end