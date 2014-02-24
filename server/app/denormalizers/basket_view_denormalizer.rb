class BasketViewDenormalizer
  include BaseDenormalizer

  def item_added(data)
    p 'BasketViewDenormalizer'
    db = Sequel.sqlite(AppSettings.sql_connection)
    article = db[:products_view].where(id: data['article_id']).first
    basket = db[:basket_view].where('basket_id = ? AND article_id = ?', data['basket_id'], data['article_id']).first
    if basket.nil?
      db[:basket_view].insert(
        basket_id: data['basket_id'], 
        article_id: data['article_id'], 
        article_description: article[:description], 
        article_price: article[:price], 
        quantity: 1)
    else
      db[:basket_view].where(id: basket[:id]).update(quantity: (basket[:quantity] + 1))        
    end  
  end
end