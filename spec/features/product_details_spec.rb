require 'rails_helper'

RSpec.feature "Visitor navigates from home page to product detail page", type: :feature, js: true do
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

  scenario "They see a product detail page" do
    #ACT 
    visit root_path # same as visiting '/' needs to do this first then be able to find link to click on product

    within first('article.product') do #since there are 10 categories, pick the first one and click link
      first('h4').click #link is located in the 'h4' element
    end

    #VERIFY
    expect(page).to have_css '.product-detail' # this conap

    #DEBUG
    # save_screenshot('product_page.png')
 
  end
end
