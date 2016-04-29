require 'rails_helper'

RSpec.describe "rsvps/edit", type: :view do
  before(:each) do
    @rsvp = assign(:rsvp, Rsvp.create!())
  end

  it "renders the edit rsvp form" do
    render

    assert_select "form[action=?][method=?]", rsvp_path(@rsvp), "post" do
    end
  end
end
