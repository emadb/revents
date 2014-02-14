class AddToBasketDenormalizer
	include BaseListener
	
	def consume(data)		
    puts "AddToBasketDenormalizer received: #{data}"
    # TODO: use parameters
		db = Sequel.sqlite(AppSettings.sql_connection)
		db.run "UPDATE products_view SET quantity = quantity-1 WHERE id = #{data["article_id"]}"
	end
end


