require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'is not valid without a name' do 
      @category = Category.create(name: 'weed')
      @product = Product.create(price: 12343, quantity: 2, category: @category)
      expect(@product).to_not be_valid
    end

    it 'is found in error array without a name' do 
      @category = Category.create(name: 'weed')
      @product = Product.create(price: 12343, quantity: 2, category: @category) 
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is valid with all parameters present' do 
      @category = Category.create(name: 'weed')
      @product = Product.create(name: 'test2', price: 1568, quantity: 1, category: @category)
      expect(@product).to be_valid
    end

    it 'is not valid without a price' do 
      @category = Category.create(name: 'cigar_tree')
      @product = Product.create(name: 'test3' , quantity: 2, category: @category)
      expect(@product).to_not be_valid
    end

    it 'is found in error array without a price' do 
      @category = Category.create(name: 'cigar_tree')
      @product = Product.create(name: 'test3' , quantity: 2, category: @category) 
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is valid with all parameters and price present' do 
      @category = Category.create(name: 'cigar_tree')
      @product = Product.create(name: 'test4', price: 31368, quantity: 8, category: @category)
      expect(@product).to be_valid
    end

    it 'is not valid without a quantity' do 
      @category = Category.create(name: 'tabasco_sauce')
      @product = Product.create(name: 'test4', price: 21111, category: @category)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
      expect(@product).to_not be_valid
    end


    it 'is valid with all parameters and quantity present' do 
      @category = Category.create(name: 'tabasco_sauce')
      @product = Product.create(name: 'test5', price: 21111, quantity: 1, category: @category)
      expect(@product).to be_valid
    end

    it 'is not valid without a category' do 
      @product = Product.create(name: 'test6', price: 21111)
      expect(@product.errors.full_messages).to include("Category can't be blank")
      expect(@product).to_not be_valid
    end

    it 'is valid with all parameters and category present' do 
      @category = Category.create(name: 'category_x')
      @product = Product.create(name: 'test7', price: 55555, quantity: 9, category: @category)
      expect(@product).to be_valid
    end  
  end

end