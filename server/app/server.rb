def start
	puts 'configure consumers'

  Wisper.add_listener(AddToBasketDenormalizer.new)
  Wisper.add_listener(BasketDenormalizer.new)

	BaseListener.subscribers.each do |subs|
		p 'register: ' + subs.name
		listener = subs.new(Redis.new)
		listener.listen
	end

	puts 'waiting for incoming messages....'
	gets	
end
