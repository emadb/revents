class BaseCommand
	attr_accessor :type
end

class AddToBasketCommand < BaseCommand
	attr_reader :basket_id, :article_id

	def initialize(basket_id, article_id)
	  @basket_id = basket_id
	  @article_id = article_id
	end
end
