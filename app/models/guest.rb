class Guest < ActiveRecord::Base
  has_many :rsvps
  has_many :invitations, through: :rsvps
  has_many :events, through: :invitations

  # Add validations to make sure that:
  # 1) No guest is both head of household and partner
  # 2) No guest is both child and head of household
  # 3) No guest is both child and partner
  # 4) Age group is one of the following: adult, teen, child, infant

  def address
    if address_line_2
      address_line_1 + "\n" + address_line_2 + "\n" + city + ", " + state + " " + zip + "\n" + country
    else
      address_line_1 + "\n" + city + ", " + state + " " + zip + "\n" + country
    end
  end
end
