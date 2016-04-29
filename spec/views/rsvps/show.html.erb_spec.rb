require 'rails_helper'

RSpec.describe "rsvps/show", type: :view do
  before(:each) do
    @rsvp = assign(:rsvp, Rsvp.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
