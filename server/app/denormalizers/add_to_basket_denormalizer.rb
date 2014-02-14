class AddToBasketDenormalizer
	include BaseListener
	
	def consume(data)		
    puts "AddToBasketDenormalizer received: #{data}"
		db = Sequel.sqlite('../web_app/db/revents.sqlite')
		db.run "UPDATE products_view SET quantity = quantity-1 WHERE id = #{data["article_id"]}"
	end
end