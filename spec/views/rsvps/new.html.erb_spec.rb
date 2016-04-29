require 'rails_helper'

RSpec.describe "rsvps/new", type: :view do
  before(:each) do
    assign(:rsvp, Rsvp.new())
  end

  it "renders new rsvp form" do
    render

    assert_select "form[action=?][method=?]", rsvps_path, "post" do
    end
  end
end
