class Guest < ActiveRecord::Base
  has_many :rsvps
  has_many :invitations, through: :rsvps
  has_many :events, through: :invitations
end
