require 'rails_helper'

RSpec.feature "Visitor navigates to product details by clicking on details button", type: :feature, js: true do
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

  scenario "They see specific product details page" do

    # ACT
    visit root_path

    # DEBUG / VERIFY
    first('a.btn-default').click
    save_screenshot
    expect(page).to have_css 'article.product-detail'
  end

end
