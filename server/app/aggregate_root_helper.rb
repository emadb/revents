module AggregateRootHelper
  @@subscribers = Hash.new{|hash,key| hash[key]=[]}

  def self.included(klass)
    klass.extend AggregateRootHelper
  end
  
  attr_accessor :id

  def uncommited_events
    @uncommited_events ||= []
  end

  def subscribe_to(event, klass, method)
    @@subscribers[event] << {klass: klass, method: method}
  end

  def raise_event(event, args)    
    uncommited_events << {name: event, args: args}
    send "on_#{event}", args
  end

  # TODO: error checking
  def commit
    repository = CommitsRepository.new
    while event = uncommited_events.shift
      repository.store(id, event)
      send_event event
    end
  end

  def send_event event
    @@subscribers[event[:name]].each do |subscriber| 
      ObjectSpace.each_object subscriber[:klass] do |instance|
        instance.send subscriber[:method], event[:args]
      end
    end
  end

  def apply_events events
    events.each do |e|
      send "on_#{e["name"]}", e["args"]
    end
  end
end