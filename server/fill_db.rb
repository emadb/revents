require 'mongo'
include Mongo

def timestamp
  Time.now.strftime('%Y%m%d%H%M%S%L')
end

mongo_client = MongoClient.new("localhost", 27017)
db = mongo_client.db('revents')

db["commits"].drop

doc = {"aggregate_id" => 1, "timestamp" => timestamp, "name" => "item_added", "args" => {:item_code => '001', :item_price => 10}}
db["commits"].insert(doc)
doc = {"aggregate_id" => 1, "timestamp" => timestamp, "name" => "item_added", "args" => {:item_code => '002', :item_price => 20}}
db["commits"].insert(doc)
doc = {"aggregate_id" => 1, "timestamp" => timestamp, "name" => "item_removed", "args" => {:item_code => '001', :item_price => 10}}
db["commits"].insert(doc)
doc = {"aggregate_id" => 1, "timestamp" => timestamp, "name" => "item_added", "args" => {:item_code => '003', :item_price => 15}}
db["commits"].insert(doc)
