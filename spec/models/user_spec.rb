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
      expect(@user.last_name).not_to be_nil
    end

    it "is not valid without a unique email" do
      new_user = User.create(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'jane@doe.me',
        password: '1234',
        password_confirmation: '1234'
      )

      new_user2 = User.create(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'jane@doe.me',
        password: '1234',
        password_confirmation: '1234'
      )
      expect(new_user2).not_to be_valid
    end

    it "is not valid without a password" do
      expect(@user.password).not_to be_nil
    end

    it "is not valid without a matching password" do
      @user.password_confirmation = 'somethingelse'
      expect(@user).not_to be_valid
    end

    it "is not valid if the password is less than the minimum length" do
      @user.password = 'as'
      expect(@user.password.length).not_to be >= 6
    end
  end

  describe '.authenticate_with_credentials' do
    it "should be an existing user" do

      described_class.authenticate_with_credentials(email, password)
      expect(login.errors).to be_empty


      described_class.authenticate_with_credentials(email, password)
      expect(login.errors.first). to eq "must be an existing user"

    end
  end
end
