require_relative 'spec_helper'

#EACH SPEC IS RUN WITHIN A TRANSACTION
#see spec_helper for more details

describe "The Users model" do
  before :each do
    @user = User.new
    @fb_hash = {"id"=>"12442226", "name"=>"Zach McArtor", "first_name"=>"Zach", "last_name"=>"McArtor", "link"=>"http://www.facebook.com/zmcartor", "username"=>"zmcartor", "gender"=>"male", "timezone"=>-4, "locale"=>"en_US", "verified"=>true, "updated_time"=>"2012-07-16T20:37:04+0000"}
  end

  it "creates a new user from a hash" do
    new_guy = @user.create_new_user @fb_hash
    new_guy['first_name'].should eq 'Zach'
    new_guy['facebook_id'].should eq 12442226
    new_guy['id'].should eq 1
  end

  it "creates new accounts if the FB info doesn't exist" do
    #feeding the hash should save in DB
    info = @user.sign_in @fb_hash
    info['id'].should eq 1
    info['first_name'].should eq "Zach"
  end

  it "ensures existing users are looked up and not re-created" do
    #create existing user. maintain it's looked up and not created again
    @user.create_new_user @fb_hash
    info = @user.sign_in @fb_hash
    info['id'].should eq 1
    info['first_name'].should eq "Zach"
  end

end
