class ProductsController < ApplicationController
	include CommandExecutor

	def index
		@products = $database[:products_view].order_by(:description)
	end

	def add_to_basket
   	send_command AddToBasketCommand.new({"basket_id" => 1, "article_id" => params[:id].to_i})
		redirect_to products_url
	end
end
