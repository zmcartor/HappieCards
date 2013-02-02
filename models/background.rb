class Background < ActiveRecord::Base
  include Paperclip::Glue

  #ouput the URl is like: model.pic.url :) then everything is happy!

  belongs_to :category
  has_many :card

  has_attached_file :pic,
    :url=>":id_:basename",
    :path=>":id_:basename_backgrounds"

  validates_attachment_presence :pic

  #Set our public URL using Paperclip "pic" function
  def public_url
    self.pic.to_s
  end

end
