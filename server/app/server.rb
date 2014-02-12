def start
	redis = Redis.new

	redis.subscribe('revents') do |on|
	  on.message do |channel, msg|
	    data = JSON.parse(msg)
	    puts "received: #{channel} - #{data}"

	  	command = Object.const_get(data['type']).new(data)

	  	execute_handler command
	  	execute_denormalizer command
	
	  end
	end
end

def execute_handler(command)
  class_name = command.class.name.split('::').last.sub(/Command/, '') + 'Handler'
  klass = Handlers.const_get(class_name)       
  handler = klass.new

  handler.execute command
end


def execute_denormalizer(command)
	class_name = command.class.name.split('::').last.sub(/Command/, '') + 'Denormalizer'
  klass = Denormalizers.const_get(class_name)       
  denormalizer = klass.new

  denormalizer.execute command

end