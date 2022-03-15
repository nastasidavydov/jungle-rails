require 'rails_helper'

RSpec.feature "Visitor clicks on 'Add to Cart' btn in product card from the home page", type: :feature, js: true do

  # add products to db as all tests starts with clean db
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
  
  scenario "their cart increases by one" do

    # ACT
    visit root_path

    # DEBUG / VERIFY

    expect(page).to have_content 'My Cart (0)'
    first('button.btn-primary').click
    save_screenshot
    expect(page).to have_content 'My Cart (1)'

  end
end
