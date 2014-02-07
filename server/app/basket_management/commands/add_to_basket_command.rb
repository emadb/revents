class AddToBasketCommand
  attr_reader :basket_id, :article_id
  
  def initialize(params)
    @basket_id = params["basket_id"]
    @article_id = params["article_id"]
  end
end
