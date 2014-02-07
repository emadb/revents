require 'spec_helper'

include Handlers

describe AddToBasketHandler  do
  it 'should create a new basket item in the collection' do
    fake_repo = double('basket_repository')
    basket = BasketManagement::Basket.new(1)
    article = BasketManagement::Article.new(1, 12)
    fake_repo.stub(:get_basket => basket)
    fake_repo.stub(:get_article => article)

    handler = AddToBasketHandler.new(fake_repo)
    
    handler.execute ::AddToBasketCommand.new({article_id:2, basket_id:1})
    expect(basket.item_count).to eq(1)
  end
end