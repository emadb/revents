module Denormalizers
	class AddToBasketDenormalizer

		def execute (command)
			db = Sequel.sqlite('../web_app/db/revents.sqlite')
			db.run "UPDATE products_view SET quantity = quantity-1 WHERE id = #{command.article_id}"			
		end
	end
end