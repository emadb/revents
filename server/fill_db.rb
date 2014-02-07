require 'mongo'
include Mongo

def timestamp
  Time.now.strftime('%Y%m%d%H%M%S%L')
end

mongo_client = MongoClient.new("localhost", 27017)
db = mongo_client.db('revents')

db["commits"].drop

doc = {"aggregate_id" => 1, "timestamp" => timestamp, "name" => "item_added", "args" => ["001"]}
db["commits"].insert(doc)
doc = {"aggregate_id" => 1, "timestamp" => timestamp, "name" => "item_added", "args" => ["002"]}
db["commits"].insert(doc)
doc = {"aggregate_id" => 1, "timestamp" => timestamp, "name" => "item_removed", "args" => ["001"]}
db["commits"].insert(doc)
doc = {"aggregate_id" => 1, "timestamp" => timestamp, "name" => "item_added", "args" => ["003"]}
db["commits"].insert(doc)


