module Handlers
  class AddToBasketHandler

    def initialize (repository = nil)
      @repository = repository || BasketManagement::BasketRepository.new
    end

    def execute(add_to_basket_command)
      # TODO: must be trasactional
      basket = @repository.get_basket(add_to_basket_command.basket_id)
      article = @repository.get_article(add_to_basket_command.article_id)

      puts '#execute'     
      puts basket.items.count

      basket.add_item (article) 
      basket.commit     
    end
  end
end

