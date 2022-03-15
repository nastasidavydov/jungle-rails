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

    it "should fail without password" do
      @user.password = nil

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should fail without password_confirmation" do
      @user.password_confirmation = nil

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "should fail if password doesn't match password_confirmation" do
      @user.password_confirmation = "pswd"

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should fail if password length is less than 4" do
      @user.password = "123"
      @user.password_confirmation = "123"

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end


  end

  describe '.authenticate_with_credentials' do
    it "should return user if authentication is successful" do
      user = User.authenticate_with_credentials(@user.email, @user.password)

      expect(user).to eq(user)
    end


    it "should return nil if email provided doesn't exist" do
      user = User.authenticate_with_credentials("email@email.com", @user.password)

      expect(user).to eq(nil)
    end


    it "should return nil if authentication if provided password is incorrect" do
      user = User.authenticate_with_credentials(@user.email, "incorrect pswd")

      expect(user).to eq(nil)
    end
  end
end
