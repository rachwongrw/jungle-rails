require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(
      first_name: 'Jane',
      last_name: 'Doe',
      email: 'me@me.me',
      password: '1234',
      password_confirmation: '1234'
    )
  end

  describe "Validations" do
    it "is valid with all valid attributes" do
    end

    it "is not valid without a first name" do
      @user.first_name = nil
      expect(@user).not_to be_valid
    end

    it "is not valid without a last name" do
      @user.last_name = nil
      expect(@user).not_to be_valid
    end

    it "is not valid without a unique email" do
      new_user = User.create(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'jane@doe.me',
        password: '123456',
        password_confirmation: '123456'
      )

      new_user2 = User.create(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'jane@doe.me',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(new_user2).not_to be_valid
    end

    it "is not valid without a password" do
      @user.password = nil
      expect(@user).not_to be_valid
    end

    it "is not valid without a matching password" do
      @user.password_confirmation = 'somethingelse'
      expect(@user).not_to eq(@user.password)
    end

    it "is not valid if the password is less than the minimum length" do
      @user.password = 'as'
      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before :each do
      @new_user3 = User.create(
        first_name: 'James',
        last_name: 'Doner',
        email: 'james@doner',
        password: '567890',
        password_confirmation: '567890'
      )
    end

    it "is not valid without an email" do
      expect(User.authenticate_with_credentials(' ','567890')).to be_nil
    end

    it "it is not valid without a password" do
      expect(User.authenticate_with_credentials('james@doner',' ')).to be_nil
    end

    it "it is not valid without a password and email" do
      expect(User.authenticate_with_credentials('james@doner','567890')).to eq @new_user3
    end
  end
end
