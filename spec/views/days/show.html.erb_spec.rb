require 'rails_helper'

RSpec.describe "days/show", :type => :view do
  before(:each) do
    @day = assign(:day, Day.create!(
      :tour_id => 1,
      :venue_id => 2,
      :schedule_id => 3,
      :income_id => 4,
      :show_number => 5,
      :show_status => "Show Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Show Status/)
  end
end
