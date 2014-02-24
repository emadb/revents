module BaseConsumer 
	@@subscribers = []
	def self.subscribers
		@@subscribers
	end
	
	def self.included(base)
		subscribers << base
	end

	def initialize(redis)
		@redis = redis
	end

	def channel_name
		self.class.name.sub(/Consumer|Denormalizer/, '')
	end

	def listen
		Thread.new do 
			@redis.subscribe(channel_name) do |on|
		  	on.message do |channel, msg|
		  		data = JSON.parse(msg)
			  	consume(data)
			  end
			end
		end
	end
end


