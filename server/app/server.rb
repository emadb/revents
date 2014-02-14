
def start
	puts 'configure consumers'

	BaseListener.subscribers.each do |subs|
		p 'register: ' + subs.name
		listener = subs.new(Redis.new)
		listener.listen
	end

	puts 'waiting for incoming messages....'
	gets	
end
