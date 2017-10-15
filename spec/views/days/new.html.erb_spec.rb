require 'rails_helper'

RSpec.describe "days/new", :type => :view do
  before(:each) do
    assign(:day, Day.new(
      :tour_id => 1,
      :venue_id => 1,
      :schedule_id => 1,
      :income_id => 1,
      :show_number => 1,
      :show_status => "MyString"
    ))
  end

  it "renders new day form" do
    render

    assert_select "form[action=?][method=?]", days_path, "post" do

      assert_select "input#day_tour_id[name=?]", "day[tour_id]"

      assert_select "input#day_venue_id[name=?]", "day[venue_id]"

      assert_select "input#day_schedule_id[name=?]", "day[schedule_id]"

      assert_select "input#day_income_id[name=?]", "day[income_id]"

      assert_select "input#day_show_number[name=?]", "day[show_number]"

      assert_select "input#day_show_status[name=?]", "day[show_status]"
    end
  end
end
