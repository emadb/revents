class BasketDenormalizer
  include BaseListener

  def channel_name
    'AddToBasket'
  end

  def consume(data)
    # TODO: add article information (description, price)
    db = Sequel.sqlite(AppSettings.sql_connection)
    
    basket = db[:basket_view].where('basket_id = ? AND article_id = ?', data['basket_id'], data['article_id']).first
    if basket.nil?
      db[:basket_view].insert(basket_id: data['basket_id'], article_id: data['article_id'], article_description: 'test1', article_price: 10, quantity: 1)
    else
      db[:basket_view].where(:id => basket[:id]).update(:quantity => (basket[:quantity] + 1))        
    end  
  end
end