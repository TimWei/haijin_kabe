puts 'Dos2unix'
`sed -i 's/\r$//' ./lib/chwall.sh`

puts 'Bundle installing...'
`bundle install`

puts 'Initializing...'
`ruby lib/kabe.rb`

puts 'Setting crontab...'
`whenever --update-crontab`