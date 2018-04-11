class BasketController < ApplicationController
  def index
    @basket = $database[:basket_view]
    @total = @basket.inject(0) { |mem, i|  mem += i[:article_price] * i[:quantity] }
  end
end
