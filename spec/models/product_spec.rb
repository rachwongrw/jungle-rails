require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "Validations" do
    before :each do
      @category = Category.new(name: 'Books category')
  
      @product = Product.new(
        name: 'Item',
        price: 2,
        quantity: 1,
        category: @category
      )
    end

    it "is valid with all valid attributes" do
      expect(@product).to be_valid
    end

    # it "is not valid without a name" do
    #   product = Product.new(name: nil)
    #   expect(product).not_to be_valid
    # end
    # it "is not valid without a price" do
    # end
    # it "is not valid without a quantity"
    # it "is not valid without a category"
  end
end
