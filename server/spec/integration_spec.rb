# require 'spec_helper'

# describe 'Basket and Warehouse scenarios' do
# 	def create_handler
# 		fake_repo = double('basket_repository')
#     basket = BasketManagement::Basket.new(1)
#     article = BasketManagement::Article.new(1, 'test')
#     fake_repo.stub(:get_basket => basket)
#     fake_repo.stub(:get_article => article)

#     Handlers::AddToBasketHandler.new(fake_repo)
# 	end

# 	def create_warehouse
# 		repository = double('warehouse_repository')
#     WarehouseArea::Warehouse.new (@repository)
# 	end

# 	it 'when an item is added to the basket the warehouse should receive a message' do
# 		handler = create_handler
#     basket_id = 2
#     article_id = 1
	  
#     handler.execute AddToBasketCommand.new({basket_id: basket_id, article_id: article_id})

# 	end
# end
