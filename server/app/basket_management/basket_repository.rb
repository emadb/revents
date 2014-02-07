module BasketManagement
  class BasketRepository
    include Mongo

    def initialize
      mongo_client = MongoClient.new("localhost", 27017)
      @db = mongo_client.db('revents')
    end

    def save (basket)
      # save the aggregate to the database
    end

    def get (basket_id)
      #get the aggregate from database
    end

    def get_basket (basket_id)           
      events = @db['commits'].find({"aggregate_id" => basket_id.to_i}).to_a
      basket = Basket.new(basket_id)
      basket.apply_events events
      basket
    end

    def get_article(article_id)
      Article.new('000', 10)
    end
  end
end