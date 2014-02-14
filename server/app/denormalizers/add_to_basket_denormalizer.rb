class AddToBasketDenormalizer
	include BaseListener
	
	def consume(data)		
    puts "AddToBasketDenormalizer received: #{data}"
		db = Sequel.sqlite(AppSettings.sql_connection)
		product = db[:products_view].where(:id => data["article_id"]).first
		db[:products_view].where(:id => data["article_id"]).update(:quantity => (product[:quantity] - 1)) 			
	end
end


