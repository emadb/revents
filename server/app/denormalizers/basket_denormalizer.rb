class BasketDenormalizer
  include BaseListener

  def channel_name
    'AddToBasket'
  end

  def consume(data)
    # TODO: move connection string 
    # TODO: use parameters
    # TODO: add article information (description, price)
    db = Sequel.sqlite('../web_app/db/revents.sqlite')
    baskets = db[:basket_view].where('id = ? AND article_id = ?', data['basket_id'], data['article_id']).all
    if baskets.length == 0
      result = db[:basket_view].insert(id: data['basket_id'], article_id: data['article_id'], article_description: 'test1', article_price: 10, quantity: 1)
    else
      db.run "UPDATE basket_view SET quantity = quantity+1 WHERE id = #{data['basket_id']} AND article_id = #{data['article_id']}"
    end  
  end
end