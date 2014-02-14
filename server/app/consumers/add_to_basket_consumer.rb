class AddToBasketConsumer
	include BaseListener
	
	def consume(data)
		repository = BasketManagement::BasketRepository.new
    puts "AddToBasketConsumer received: #{data}"
		basket = repository.get_basket(data["basket_id"])

		basket.subscribe_to :item_added, AddToBasketConsumer, :denormalize

  	article = repository.get_article(data["article_id"])
  	basket.add_item (article) 
  	basket.commit    
	end

	def denormalize args
		
	end
end