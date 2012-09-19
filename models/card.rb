class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :background
  has_many :callback

end
