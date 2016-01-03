require 'spec_helper'

describe "Sound", type: :model do
  before do 
    @user = User.create(:username => 'first_user', :password => 'password', :real_name => "First User")
  end

  let(:sound) { Sound.create(:title => 'My Sound', :soundfile => 'new_sound.mp3') }

  context "validations" do 
    it "is invalid without a title" do 
      expect(Sound.create(title: nil, soundfile: 'new_sound.mp3')).to_not be_valid
    end
  end

  context "attributes" do
    it "can initialize a user" do
      expect(Sound.new).to be_an_instance_of(Sound)
    end

    it "can have a username" do
      expect(sound.title).to eq('My Sound')
    end

    it "can have a real name" do
      expect(sound.soundfile).to eq('new_sound.mp3')
    end
  end
end