require 'spec_helper'

describe "User", type: :model do
  let(:user) { User.create(:username => 'first_user', :password => 'password', :real_name => 'First User') }

  context "validations" do 
    it "is invalid without a username" do 
      expect(User.create(username: nil, real_name: 'Garf Nogel', password: 'password')).to_not be_valid
    end

    it "is invalid without a real name" do 
      expect(User.create(username: 'garf_nogel', real_name: nil, password: 'password')).to_not be_valid
    end

    it "is invalid without a password" do 
      expect(User.create(username: 'garf_nogel', real_name: 'Garf Nogel', password: nil)).to_not be_valid
    end

    it "is invalid without a unique username" do 
      expect(User.create(username: 'first_user', real_name: 'Garf Nogel', password: "very_secret_phrase")).to_not be_valid
    end
  end

  context "attributes" do
    it "can initialize a user" do
      expect(User.new).to be_an_instance_of(User)
    end

    it "can have a username" do
      expect(user.username).to eq('first_user')
    end

    it "can have a real name" do
      expect(user.real_name).to eq('First User')
    end
  end

  context "authetication" do
    let(:second_user) { User.create(:username => 'second_user', :password => 'password_two', :real_name => 'Second User') }
    let(:found_user) { User.find_by(username: second_user.username) }

    it "can find a user by username" do
      second_user = User.find_by(username: found_user.username)
      expect(second_user).to eq(found_user)
    end

    it "can authenticate a user" do
      expect(second_user.authenticate('password_two')).to eq(second_user)
    end
  end
end