require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should require password and password_confirmation to create user model' do
      @user = User.new(first_name: "Test Name", last_name: "Test Last Name", email: "test email", password: "hello", password_confirmation: "hello")
      @user.save
      expect(@user).to be_valid 
    end
    it 'should require password and password_confirmation to create user model' do
      @user = User.new(first_name: "Test Name", last_name: "Test Last Name", email: "test email", password: nil, password_confirmation: "hello")
      @user.save
      expect(@user).to_not be_valid 
    end
    it 'should require matching password and password_confirmation to create user model' do
      @user = User.new(first_name: "Test Name", last_name: "Test Last Name", email: "test email", password: "hello", password_confirmation: "notMatching")
      @user.save
      expect(@user).to_not be_valid 
    end
    it 'should require emails to be unique and not case sensitive' do
      @user1 = User.new(first_name: "Test Name", last_name: "Test Last Name", email: "test@test.COM", password: "hello", password_confirmation: "notMatching")
      @user1.save
      @user2 = User.new(first_name: "Test Name", last_name: "Test Last Name", email: "TEST@TEST.com", password: "hello", password_confirmation: "notMatching")
      @user2.save
      expect(@user2).to_not be_valid 
    end
    it 'should require email to create user' do
      @user1 = User.new(first_name: "Test Name", last_name: "Test Last Name", email: nil, password: "hello", password_confirmation: "notMatching")
      @user1.save
      expect(@user1).to_not be_valid 
    end
    it 'should require first name to create user' do
      @user1 = User.new(first_name: nil, last_name: "Test Last Name", email: "test@test.COM", password: "hello", password_confirmation: "notMatching")
      @user1.save
      expect(@user1).to_not be_valid 
    end
    it 'should require last name to create user' do
      @user1 = User.new(first_name: "Test Name", last_name: nil, email: "test@test.COM", password: "hello", password_confirmation: "notMatching")
      @user1.save
      expect(@user1).to_not be_valid 
    end
    it 'should require password of length greater than or equal to 4 to create user' do
      @user1 = User.new(first_name: "Test Name", last_name: "Test lastname", email: "test@test.COM", password: "hey", password_confirmation: "hey")
      @user1.save
      expect(@user1).to_not be_valid 
    end
  end

  describe '.authenticate_with_credentials' do
    
    it 'should still authenicate successfully if a vistor has a few spaces before or after their email address' do
      user1 = User.create({first_name: "Test Name", last_name: "Test lastname", email: "example@domain.com", password: "hello", password_confirmation: "hello"})
      
      expect(User.authenticate_with_credentials(" example@domain.com ", "hello")).to eq(user1)
    end
    it 'should still authenicate successfully if a vistor types in the wrong case for their email address' do
      user1 = User.create({first_name: "Test Name", last_name: "Test lastname", email: "eXample@domain.COM", password: "hello", password_confirmation: "hello"})
      
      expect(User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM", "hello")).to eq(user1) 
    end
  end
end
