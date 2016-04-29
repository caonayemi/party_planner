class Rsvp < ActiveRecord::Base
  belongs_to :guest
  belongs_to :invitation
end
