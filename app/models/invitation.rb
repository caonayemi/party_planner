class Invitation < ActiveRecord::Base
  belongs_to :event
  has_many :rsvps
  has_many :guests, through: :rsvps

  def update_envelop
    name_line + "\n" + head_of_household.address
  end

  def name_line
    head = head_of_household
    partner = partner
    guests = self.guests

    case
    when guests.length == 1
      @titles = head.title
      @first_names = head.first_name
      @family_name = head.last_name
      @additional_guests = nil
    when guests.length == 2 && head.last_name == partner.last_name
      @titles = head.title + " & " + partner.title
      @first_names = head.first_name + " and " + partner.first_name
      @family_name = head.last_name
      @additional_guests = nil
    when guests.length == 2
      @titles = head.title
      @first_names = head.first_name
      @family_name = head.last_name
      @additional_guests = partner.title + " " + partner.first_name + " " partner.last_name
    when guests.length > 2 && head.last_name == partner.last_name
      @titles = head.title + " & " + partner.title
      @first_names = head.first_name + " and " + partner.first_name
      @family_name = head.last_name
      @additional_guests = "Family"
    else
      @titles = head.title
      @first_names = head.first_name
      @family_name = head.last_name
      @additional_guests = partner.title + " " + partner.first_name + " " partner.last_name + " and Family"
    end

    if additional_guests
      return @titles + " " + @first_names + " " + @family_name + " and " + @additional_guests
    else
      return @titles + " " + @first_names + " " + @family_name
    end
  end

  def head_of_household
    heads = []
    guests = self.guests
    raise NoAssignedGuestsError if guests.empty?

    guests.each do |guest|
      heads << guest if guest.is_head_of_household
    end

    case heads.length
    when 0
      raise NoHeadOfHouseholdError
    when 1
      return heads[0]
    else
      raise MoreThanOneHeadOfHouseholdError
    end
  end

  def partner
    partners = []
    guests = self.guests
    raise NoAssignedGuestsError if guests.empty?

    guests.each do |guest|
      partners << guest if guest.is_partner
    end

    case partners.length
    when 0
      return nil
    when 1
      return partners[0]
    else
      raise MoreThanOnePartnerError
    end
  end

  def NoAssignedGuestsError < StandardError
  end

  def NoHeadOfHouseholdError < StandardError
  end

  def MoreThanOneHeadOfHouseholdError < StandardError
  end

  def MoreThanOnePartnerError < StandardError
  end
end
