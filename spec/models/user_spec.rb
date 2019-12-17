require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = User.new
  end

  it 'Should save with all fields filled' do
    full_user = User.new(first_name: 'bahareh', last_name: 'ghadimi', email: 'bahar@gmail.com', password: '123456', password_confirmation: '123456')
    full_user.save
    expect(full_user).to be_valid
  end

  it 'Should throw an error without a first name' do
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:first_name]).to include("can't be blank")
  end
  
  it 'Should throw ean rror without a last name!' do
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:last_name]).to include('can\'t be blank')
  end

  it 'Should throw an error without a password!' do
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:password]).to include('can\'t be blank')
  end

  it 'Should be invalid if password and password confirmation do not match' do
    @user = User.new(first_name: 'a', last_name: 'b', email: 'email@email.com', password: 'apples', password_confirmation: 'apples')
    @user2 = User.new(first_name: 'b', last_name: 'a', email: 'email@email.com', password: 'apples', password_confirmation: 'APPLES')
    @user.save
    @user2.save
    expect(@user.password).to eq(@user.password_confirmation)
    expect(@user2.password).to_not eq(@user2.password_confirmation)
  end

  it 'Should be invalid if password is too short' do

    @user = User.new(first_name: 'navid', last_name: 'tehranifar', email: 'navid@gmail.com', password: '12', password_confirmation: '12')
    @user.save
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:password]).to include("is too short (minimum is 6 characters)")
    expect(@user.errors.messages[:password_confirmation]).to include("is too short (minimum is 6 characters)")
  end

  it 'Should be invalid without an email' do
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:email]).to include('can\'t be blank')
  end

  it 'Should require a unique email' do
    @user = User.new(first_name: 'bahar', last_name: 'ghadimi', email: 'bahar@gmail.com', password: 'apples', password_confirmation: 'apples')
    @user2 = User.new(first_name: 'bahar', last_name: 'ghadimi', email: 'BAHAR@gmail.com', password: 'APPLES', password_confirmation: 'APPLES')
    @user.save
    @user2.save
    expect(@user).to be_valid
    expect(@user2).to_not be_valid
    expect(@user2.errors.messages[:email]).to include('has already been taken')
  end

  context 'Existing user validation' do
    let(:user) do
      @user = User.new(first_name: 'bahar', last_name: 'ghadimi', email: 'bahar@gmail.com', password: '123456', password_confirmation: '123456')
      @user.save
      User.find @user.id
    end

    it "Should be valid with no changes" do
      expect(user).to_not be_valid
    end

    it "Should not be valid with an empty password" do
      user.password = user.password_confirmation = ""
      expect(user).to_not be_valid
    end

    it "Should be valid with a new password" do
      user.password = user.password_confirmation = "new password"
      expect(user).to be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    
    it 'Should authenticate if password and email are valid' do
      user = User.new(first_name: 'bahar', last_name: 'ghadimi', email: 'bahar@gmail.com', password: '123456', password_confirmation: '123456')
      user.save
      valid_user = User.authenticate_with_credentials('bahar@gmail.com', '123456')
  
      expect(valid_user).to eq(user)
      end
  
      it 'Should not authenticate if password and email are valid' do
        user = User.new(first_name: 'bahar', last_name: 'ghadimi', email: 'bahar@gmail.com', password: '123456', password_confirmation: '123456')
        user.save
        invalid_user = User.authenticate_with_credentials('notbahar@notgmail.com', '123456')
    
        expect(invalid_user).to_not eq(user)
      end
  
      it 'Should authenticate if user adds uppercase letters to their email' do
        user = User.new(first_name: 'bahar', last_name: 'ghadimi', email: 'bahar@gmail.com', password: '123456', password_confirmation: '123456')
        user.save
        valid_user = User.authenticate_with_credentials('BAHAR@gmail.com', '123456')
        expect(valid_user).to eq(user)
      end
  
      it 'Should authenticate if user adds spaces to beginning or end of email' do
        user = User.new(first_name: 'bahar', last_name: 'ghadimi', email: 'bahar@gmail.com', password: '123456', password_confirmation: '123456')
        user.save
        valid_user = User.authenticate_with_credentials(' bahar@gmail.com ', '123456')
        expect(valid_user).to eq(user)
      end
  end
end
