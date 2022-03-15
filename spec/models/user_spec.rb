require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create(first_name: "first name", last_name: "last_name", email: "example@mail.com", password: "password", password_confirmation: "password")
    
  end
  

  describe 'Validations' do
    
    it "should fail without first name" do
      @user.first_name = nil
      
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "should fail without last name" do
      @user.last_name = nil

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "should fail without email" do
      @user.email = nil

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "should fail if email is not unique" do
      @user2 = User.create(first_name: "first name", last_name: "last_name", email: "EXAMPlE@mail.com", password: "password", password_confirmation: "password")

      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end


  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
