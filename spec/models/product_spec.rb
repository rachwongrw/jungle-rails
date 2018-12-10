require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "Validations" do
    before :each do
      @category = Category.new(name: 'Books category')
  
      @product = Product.new(
        name: 'Item',
        price_cents: 200,
        quantity: 1,
        category: @category
      )
    end

    it "is valid with all valid attributes" do
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @product.name = nil
      expect(@product).not_to be_valid
    end
    
    it "is not valid without a price" do
      @product.price_cents = nil
      expect(@product).not_to be_valid
    end

    it "is not valid without a quantity" do
      @product.quantity = nil
      expect(@product).not_to be_valid
    end

    it "is not valid without a category" do
      @product.category = nil
      expect(@product).not_to be_valid
    end
  end
end
