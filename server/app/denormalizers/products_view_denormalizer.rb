class ProductsViewDenormalizer
	include BaseDenormalizer

	def item_added(data)		
      puts "ProductsViewDenormalizer received: #{data}"
      db = Sequel.sqlite(AppSettings.sql_connection)
      product = db[:products_view].where(code: data[:item_code]).first
      db[:products_view].where(code: data[:item_code]).update(quantity: (product[:quantity] - 1))	      
	end
  
end


