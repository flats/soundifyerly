require 'spec_helper'

describe "User", type: :model do
  let(:user) { User.create(:username => 'first_user', :password => 'password', :real_name => 'First User') }

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
end