require 'rufus-scheduler'
require 'tzinfo/data'

ENV['TZ'] = 'Asia/Taipei'
scheduler = Rufus::Scheduler.new

scheduler.every '1h' do
  system 'ruby ./lib/kabe.rb'
end

scheduler.every '15m' do
  system 'powershell.exe ./lib/chwall.ps1'
end

scheduler.join