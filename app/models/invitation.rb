class Invitation < ActiveRecord::Base
  belongs_to :event
  has_many :rsvps
  has_many :guests, through: :rsvps
end
