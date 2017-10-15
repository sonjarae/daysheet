require 'rails_helper'

RSpec.describe "days/index", :type => :view do
  before(:each) do
    assign(:days, [
      Day.create!(
        :tour_id => 1,
        :venue_id => 2,
        :schedule_id => 3,
        :income_id => 4,
        :show_number => 5,
        :show_status => "Show Status"
      ),
      Day.create!(
        :tour_id => 1,
        :venue_id => 2,
        :schedule_id => 3,
        :income_id => 4,
        :show_number => 5,
        :show_status => "Show Status"
      )
    ])
  end

  it "renders a list of days" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Show Status".to_s, :count => 2
  end
end
