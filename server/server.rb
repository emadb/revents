require 'rubygems'
require 'redis'
require 'json'
Dir['./basket_management/commands/*.rb'].each{ |f| require f }

$redis = Redis.new

$redis.subscribe('revents') do |on|
  on.message do |channel, msg|
    data = JSON.parse(msg)
    puts "received: #{channel} - #{data}"
    puts data["type"]

 #   command = Object.const_get(data['type']).new
  #  handler = find_handler(command)
#   handler.execute command
  end
end


def find_handler(command)
  class_name = command.class.name.split('::').last.sub(/Command/, '') + 'Handler'
  klass = Handlers.const_get(class_name)       
  klass.new
end