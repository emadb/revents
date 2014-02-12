require 'mongo'

class CommitsRepository
  include Mongo

  def initialize
    mongo_client = MongoClient.new("localhost", 27017)
    @db = mongo_client.db('revents')
  end

  def store(aggregate_id, event)
    p '####'
    p event
    event["timestamp"] = get_timestamp
    event["aggregate_id"] = aggregate_id
    @db["commits"].insert(event)
  end

  def get_timestamp
    Time.now.strftime('%Y%m%d%H%M%S%L')
  end
end
