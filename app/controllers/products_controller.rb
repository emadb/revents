class ProductsController < ApplicationController
	include CommandExecutor

	def index
		@products = $database[:products_view].order_by(:description)
	end

	def add_to_basket
		send_command AddToBasketCommand.new(1, params[:id])
		redirect_to products_url
	end
end
