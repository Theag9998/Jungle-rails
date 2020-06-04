require 'rails_helper'

RSpec.feature "Visitor can navigate from the home page to the product detail page by clicking on a product", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "They click on a product" do
    # ACT
    visit root_path
    
    click_on @category.products.first.name
    
    
    
    # DEBUG / VERIFY
    #save_screenshot

    #Verify
    expect(page).to have_css 'section.products-show'
  end
end
