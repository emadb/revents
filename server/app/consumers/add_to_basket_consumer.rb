class AddToBasketConsumer
  include BaseConsumer

  def consume(data)
    puts "AddToBasketConsumer received: #{data}"
    repository = BasketManagement::BasketRepository.new
    basket = repository.get_basket(data["basket_id"])
    article = repository.get_article(data["article_id"])
    basket.add_item (article)

    basket.commit
  end
end
