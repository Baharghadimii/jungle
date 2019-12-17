require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    it 'Should save the product when all four fields are set' do
      @category = Category.create(name: "something")
      @product = Product.create(name: "something", price: 20,quantity: 2, category: @category)
      @product.save!

      expect(@product).to be_valid
    end
    it 'Should throw an error if name is not set' do
      @category = Category.create(name: "something")
      @product = Product.create(price: 20,quantity: 2, category: @category)
  
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'Should throw an error if price is not set' do
      @category = Category.create(name: "something")
      @product = Product.create(name: "something", quantity: 2, category: @category)

      expect(@product.errors.full_messages).to include("Price is not a number")
    end
    it 'Should throw an error if quantity is not set' do
      @category = Category.create(name: "something")
      @product = Product.create(name: "something",price: 20, category: @category)

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'Should throw an error if category is not set' do
      @product = Product.create(name: "something",price: 20, quantity: 2)

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
