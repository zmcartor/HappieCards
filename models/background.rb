class Background < ActiveRecord::Base
  include Paperclip::Glue

  #ouput the URl is like: model.pic.url :) then everything is happy!

  belongs_to :category
  has_many :card

  has_attached_file :pic,
    :url=>":id_:basename",
    :path=>":id_:basename_backgrounds",
    :storage => :fog,
    :fog_credentials=> {
      :provider =>'Rackspace',
      :rackspace_api_key => '5860606f0f14fbf4d16833e62600379c',
      :rackspace_username => 'zmcartor'
    },
  :fog_directory => 'happiecards', #CDN container
  :fog_public => true,
  :fog_host => 'http://89a1bd14c387a173d429-61ab973465be3d5f3bfd4632d23d0341.r49.cf1.rackcdn.com' #found in rackspace panel

  validates_attachment_presence :pic

  #Set our public URL using Paperclip "pic" function
  def public_url
    self.pic.to_s
  end

end
