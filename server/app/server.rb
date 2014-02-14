def start

	BaseConsumer.subscribers.each do |subs|
		p 'register: ' + subs.name
		listener = subs.new(Redis.new(:timeout => 0))
		listener.listen
	end


	BaseDenormalizer.subscribers.each do |deno|
		p 'register denormalizer: ' + deno.name
		Wisper.add_listener(deno.new)
	end

	puts 'waiting for incoming messages....'
	gets	
end
