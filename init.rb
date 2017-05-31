require 'os'

if OS.windows?
    puts 'preparing process for windows'
    system 'ruby config/windows_schedule.rb'


elsif OS.posix?
    puts 'Dos2unix'
    `sed -i 's/\r$//' ./lib/chwall.sh`

    puts 'Bundle installing...'
    `bundle install`

    puts 'Initializing...'
    `ruby lib/get_image.rb`

    puts 'Setting crontab...'
    `whenever --update-crontab`
end