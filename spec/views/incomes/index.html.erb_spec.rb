require 'rails_helper'

RSpec.describe "incomes/index", :type => :view do
  before(:each) do
    assign(:incomes, [
      Income.create!(
        :guarantee => ""
      ),
      Income.create!(
        :guarantee => ""
      )
    ])
  end

  it "renders a list of incomes" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
