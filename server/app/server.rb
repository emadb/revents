def start
	$redis = Redis.new

	$redis.subscribe('revents') do |on|
	  on.message do |channel, msg|
	    data = JSON.parse(msg)
	    puts "received: #{channel} - #{data}"

	  	command = Object.const_get(data['type']).new(data)
	    handler = find_handler(data['type'])
	    puts handler
	    handler.execute command
	  end
	end
end

def find_handler(command)
  class_name = command.split('::').last.sub(/Command/, '') + 'Handler'
  klass = Handlers.const_get(class_name)       
  klass.new
end