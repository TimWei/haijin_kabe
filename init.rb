puts 'Dos2unix'
`sed -i 's/\r$//' ./lib/chwall.sh`

puts 'Bundle installing...'
`bundle install`

puts 'Initializing...'
`ruby lib/get_image.rb`

puts 'Setting crontab...'
`whenever --update-crontab`