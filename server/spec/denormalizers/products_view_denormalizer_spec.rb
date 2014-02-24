require 'sequel'
require 'spec_helper'

describe 'denormalize an event' do
  it 'when an event arrives should update products_view' do
    denormalizer = ProductsViewDenormalizer.new
    denormalizer.item_added({item_code: 'P1', item_price:10})
  end
end