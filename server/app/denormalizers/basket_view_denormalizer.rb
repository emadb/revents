class BasketViewDenormalizer
  include BaseDenormalizer

  def item_added(data)
    db = Sequel.sqlite(AppSettings.sql_connection)
    article = db[:products_view].where(code: data[:item_code]).first
    basket = db[:basket_view].where('basket_id = ? AND article_id = ?', data[:basket_id], article[:id].to_i).first
    if basket.nil?
      db[:basket_view].insert(
        basket_id: data[:basket_id], 
        article_id: article[:id], 
        article_description: article[:description], 
        article_price: article[:price], 
        quantity: 1)
    else
      db[:basket_view].where(id: basket[:id]).update(quantity: (basket[:quantity] + 1))        
    end  
  end
end