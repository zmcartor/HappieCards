class User < ActiveRecord::Base

  has_many :card

  #details looks like:
  #{"id"=>"12442226", "name"=>"Zach McArtor", "first_name"=>"Zach", "last_name"=>"McArtor", "link"=>"http://www.facebook.com/zmcartor", "username"=>"zmcartor", "gender"=>"male", "timezone"=>-4, "locale"=>"en_US", "verified"=>true, "updated_time"=>"2012-07-16T20:37:04+0000"}
  #

  def sign_in(details)
    our_user = User.first(:conditions =>{:facebook_id =>details['facebook_id']} )
    return our_user.attributes if our_user

    #not registered, create account for them.
    return self.create_new_user details
  end

  def create_new_user(details)
    details = self.filter_attributes details
    new_one = User.create details

    #TODO find better way to check errors
    return new_one.attributes unless new_one.eql? false
    puts new_one.errors.inspect
    false
  end

  def filter_attributes(attrs)
    to_keep = ["id", "name" , "first_name" , "last_name" , "username" , "gender"]
    attrs.keep_if { |k,v| to_keep.include? k }
    attrs['facebook_id'] = attrs['id']
    attrs
  end

end
