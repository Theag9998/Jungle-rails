require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'product with all four fields set will save successfully' do
      @category = Category.new(name: "Test Name")
      @category.save
      @product = Product.new(name: 'Some thing', price: 500, quantity: 2, category: @category)
      expect(@product).to be_valid 
    end
    it 'product with all four fields set will save successfully' do
      @category = Category.new(name: "Test Name")
      @category.save
      @product = Product.new(name: nil, price: 500, quantity: 2, category: @category)
      expect(@product).to_not be_valid 
    end
    it 'product with all four fields set will save successfully' do
      @category = Category.new(name: "Test Name")
      @category.save
      @product = Product.new(name: 'Some thing', price: nil, quantity: 2, category: @category)
      expect(@product).to_not be_valid 
    end
    it 'product with all four fields set will save successfully' do
      @category = Category.new(name: "Test Name")
      @category.save
      @product = Product.new(name: 'Some thing', price: 500, quantity: nil, category: @category)
      expect(@product).to_not be_valid 
    end
    it 'product with all four fields set will save successfully' do
      @category = Category.new(name: "Test Name")
      @category.save
      @product = Product.new(name: 'Some thing', price: 500, quantity: 2, category: nil)
      expect(@product).to_not be_valid 
    end
    it 'should have expect error in the full_messages array' do
      @category = Category.new(name: "Test Name")
      @category.save
      @product = Product.new(name: 'Some thing', price: nil, quantity: 2, category: nil)
      @product.save
      error_msg = @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Price is not a number")
    end
  end
end
