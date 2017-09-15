require 'os'

if OS.windows?
  puts 'preparing process for windows'
  `ruby cron/windows_schedule.rb`
  
elsif OS.posix?
  puts 'Avoiding windows newline crush'
  `sed -i 's/\r$//' ./cron/chwall.sh`

  puts 'Setting crontab...'
  `whenever --update-crontab --load-file cron/schedule.rb`
end