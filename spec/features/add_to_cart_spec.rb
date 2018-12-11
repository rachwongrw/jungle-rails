require 'rails_helper'

RSpec.feature "Visitor clicks on 'Add to Cart' button", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
      end
    end

    scenario "They see their cart increase by 1" do
      visit root_path

      within first('article.product') do
        click_button 'Add'
      end

      expect(page).to have_content '1'

      save_screenshot('add_to_cart.png')

    end
end
