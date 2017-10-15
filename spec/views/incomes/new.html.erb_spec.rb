require 'rails_helper'

RSpec.describe "incomes/new", :type => :view do
  before(:each) do
    assign(:income, Income.new(
      :guarantee => ""
    ))
  end

  it "renders new income form" do
    render

    assert_select "form[action=?][method=?]", incomes_path, "post" do

      assert_select "input#income_guarantee[name=?]", "income[guarantee]"
    end
  end
end
