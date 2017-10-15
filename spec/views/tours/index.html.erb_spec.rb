require 'rails_helper'

RSpec.describe "tours/index", :type => :view do
  before(:each) do
    assign(:tours, [
      Tour.create!(
        :name => "Name"
      ),
      Tour.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of tours" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
