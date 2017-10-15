require 'rails_helper'

RSpec.describe "tours/show", :type => :view do
  before(:each) do
    @tour = assign(:tour, Tour.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
