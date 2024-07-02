require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do 
    it 'is not a valid user without a password_confirmation' do
      @user = User.create(first_name: 'George', last_name: 'lewis', email: 'hello@example.com', password: 'ha')
      expect(@user).to_not be_valid
    end

    it 'is not a valid user without a password' do
      @user = User.create(first_name: 'George', last_name: 'lewis', email: 'hello@example.com', password_confirmation: 'ha')
      expect(@user).to_not be_valid
    end

    it 'is a valid user when all arguments are passed in' do
      @user = User.create(first_name: 'George', last_name: 'lewis', email: 'hello@example.com',password: 'ha', password_confirmation: 'ha')
      expect(@user).to be_valid
    end

    it 'is invalid when password and password_confirmation do not match' do
      @user = User.create(first_name: 'George', last_name: 'lewis', email: 'hello@example.com',password: 'ha', password_confirmation: 'yy')
      expect(@user).to_not be_valid
    end

    it 'is invalid because the test@test.com is unique' do
      @user1 = User.create(first_name: 'George', last_name: 'lewis', email: 'test@test.com',password: 'hw', password_confirmation: 'hw')
      expect(@user1).to be_valid

      @user2 = User.create(first_name: 'George', last_name: 'lewis', email: 'test@test.com',password: 'hw', password_confirmation: 'hw')
      expect(@user2).to_not be_valid

      @user3 = User.create(first_name: 'George', last_name: 'lewis', email: 'TEST@TEST.com',password: 'hw', password_confirmation: 'hw')
      expect(@user3).to_not be_valid
    end

    it 'is invalid as the password length is 1' do
      @user1 = User.create(first_name: 'George', last_name: 'lewis', email: 'test@test.com',password: 'h', password_confirmation: 'h')
      expect(@user1).to_not be_valid
    end

    it 'is valid as the password length is 3' do
      @user = User.create(first_name: 'George', last_name: 'lewis', email: 'test@test.com',password: 'hhr', password_confirmation: 'hhr')
      expect(@user).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should not be nil as password and user-password is hhh ' do
       User.create(first_name: 'George', last_name: 'Lewis', email: 'test@test.com', password: 'hhh', password_confirmation: 'hhh'
      )

      @user = User.authenticate_with_credentials('test@test.com', 'hhh')
      expect(@user).not_to be(nil)
    end

    it 'should be nil as password is hhh and user-password is hhe ' do
      User.create(first_name: 'George', last_name: 'Lewis',email:'test@test.com', password: 'hhh', password_confirmation: 'hhh'
      )

      @user = User.authenticate_with_credentials('test@test.com', 'hhe')
      expect(@user).to be(nil)
    end

    it 'will not be nil with whitespaces in email' do
      User.create(first_name: 'first_name', last_name: 'last_name',email: 'test@test.com', password: 'hhh', password_confirmation: 'hhh'
      )

      @user = User.authenticate_with_credentials('  test@test.com  ', 'hhh')
      expect(@user).not_to be(nil)
    end

    it 'will not be nil as email is not case sensitive' do
      User.create(
        first_name: 'first_name', last_name: 'last_name', email: 'test@test.com', password: 'hhh', password_confirmation: 'hhh'
      )

      @user = User.authenticate_with_credentials('tesT@tEst.com', 'hhh')
      expect(@user).not_to be(nil)
    end
  end
end
