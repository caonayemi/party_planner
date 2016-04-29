require 'rails_helper'

RSpec.describe Guest, type: :model do
end

RSpec.describe Guest, ".address" do
  before(:each) do
    @guest = Guest.create!(
      title: "Mr.",
      first_name: "Adekunle",
      last_name: "Onayemi",
      priority: "A",
      is_head_of_household: true,
      is_partner: nil,
      age_group: "adult",
      address_line_1: "706 North Taylor Avenue",
      address_line_2: nil,
      city: "Oak Park",
      state: "Illinois",
      zip: "60302"
    )
  end

  it "should return a string" do
    expect( @guest.address ).to be_a( String )
  end

  it "should return at least three lines of text" do
    expect( /.+\n.+\n.+/.match(@guest.address) ).not_to be_nil
  end

  it "should return only three lines of text if no 'line 2' is provided" do
    expect( /.+\n.+\n.+\n.+/.match(@guest.address) ).to be_nil
  end

  it "should return four lines of text if there is a 'line 2'" do
    @guest.update_attributes( address_line_2: "No. 7" )
    expect( /.+\n.+\n.+\n.+/.match(@guest.address) ).not_to be_nil
  end
end
