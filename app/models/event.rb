class Event < ActiveRecord::Base
  has_many :invitations
  has_many :rsvps, through: :invitations
  has_many :guests, through: :invitations
end
