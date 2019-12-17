require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @product = Product.new
    @category = Category.new name: 'Something'
  end

  it 'Should save when all four fields are set' do
    @full_product = Product.new(name: 'something', price: 100, quantity: 5, category: @category)
    @full_product.save!
    expect(@full_product).to be_valid
  end

  it 'Should throw an error when name is not set' do
    expect(@product).to_not be_valid
    expect(@product.errors.messages[:name]).to include('can\'t be blank')
  end

  it 'Should throw an error when price is not set' do
    expect(@product).to_not be_valid
    expect(@product.errors.messages[:price]).to include('can\'t be blank')
  end

  it 'Should throw an error when quantity is not set' do
    expect(@product).to_not be_valid
    expect(@product.errors.messages[:quantity]).to include('can\'t be blank')
  end

  it 'Should throw an error when category is not set' do
    expect(@product).to_not be_valid
    expect(@product.errors.messages[:category]).to include("can\'t be blank")
  end
  
end
