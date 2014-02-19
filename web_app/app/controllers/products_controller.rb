class ProductsController < ApplicationController
	include CommandExecutor

	def index
		@products = $database[:products_view].order_by(:description)
	end

	def add_to_basket
    # TODO: enrich the command with: article description and price
    # TODO: who is in charge of this?
		send_command AddToBasketCommand.new({"basket_id" => 1, "article_id" => params[:id]})
		redirect_to products_url
	end
end
