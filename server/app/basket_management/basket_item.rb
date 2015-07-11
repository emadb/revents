module BasketManagement
  class BasketItem
    attr_reader :code, :price, :quantity

    def initialize(item, quantity = 1)
      @code = item[:item_code]
      @price = item[:item_price]
      @quantity = quantity
    end

    def increase_quantity
      @quantity = @quantity + 1
    end

    def decrease_quantity
      @quantity = @quantity - 1
    end

    def item_price
      @price
    end

    def item_code
      @code
    end

    def total_price
      item_price * quantity
    end
  end
end
