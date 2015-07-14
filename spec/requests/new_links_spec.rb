require 'rails_helper'

RSpec.describe "Creating a new link", type: :feature do
  before do 
    visit root_path
    fill_in "Url", with: "http://google.com"
  end

  it "should create a new link" do
    expect { click_button "Submit" }.to change(Link, :count).by(1)
  end
end
