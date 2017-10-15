require 'rails_helper'

RSpec.describe "tours/new", :type => :view do
  before(:each) do
    assign(:tour, Tour.new(
      :name => "MyString"
    ))
  end

  it "renders new tour form" do
    render

    assert_select "form[action=?][method=?]", tours_path, "post" do

      assert_select "input#tour_name[name=?]", "tour[name]"
    end
  end
end
