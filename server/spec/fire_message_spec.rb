require 'redis'
require 'json'
require 'spec_helper'

describe 'fire a message to the bus' do
  it 'when a message arrives' do
    $redis = Redis.new
    command = {"type" => "AddToBasketCommand", "basket_id" => 1, "article_id" => 2}
    $redis.publish 'revents', command.to_json
  end
end
