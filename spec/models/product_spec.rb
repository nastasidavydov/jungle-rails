require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    before(:each) do
      @category = Category.create!(name: "category name")
      @product = Product.create!(name: "product name", price_cents: 250, quantity: 5, category_id: @category.id)
      
    end

    it "should save product with all valid fields" do
      @product.save!

      expect(@product.id).to be_present
    end

    it "should not let a product be created without name" do
      @product.name = nil
      
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "should not let a product be created without price" do
      @product.price_cents = nil

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "should not let a product be created without quantity" do
      @product.quantity = nil

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should not let a product be created without category" do
      @product.category_id = nil

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end