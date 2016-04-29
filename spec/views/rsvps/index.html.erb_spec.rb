require 'rails_helper'

RSpec.describe "rsvps/index", type: :view do
  before(:each) do
    assign(:rsvps, [
      Rsvp.create!(),
      Rsvp.create!()
    ])
  end

  it "renders a list of rsvps" do
    render
  end
end
