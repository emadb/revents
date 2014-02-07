module BasketManagement
  class Basket
    include AggregateRootHelper

    attr_reader :items

    def initialize (id)
      self.id = id
      @items = []
    end

    def add_item (item)
      raise_event :item_added, {item_code: item.code, item_price: item.price}
    end

    def remove_item (item)
      raise_event :item_removed, {item_code: item.code}
    end

    def item_count
      @items.size
    end

    def empty
      @items.clear
    end

    def total_price
      @items.inject(0) { |sum, i| sum + i.total_price }
    end

    private
    def on_item_added item
      p '#####'
      p item
      get_item(item[:item_code]).try(:increase_quantity) || @items << BasketItem.new(item)      
    end

    def on_item_removed item
      selected_item = get_item(item[:item_code])
      selected_item.decrease_quantity
      if selected_item.quantity == 0
        items.delete selected_item
      end
    end

    def get_item (item_code)
      @items.select{|i| i.item_code == item_code}.try :first
    end
  end
end
