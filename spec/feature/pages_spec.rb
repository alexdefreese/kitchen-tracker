require 'spec_helper'

feature "Pages" do
  describe "GET /" do
    it "should have the content 'Kitchen Tracker'" do
      visit root_path
      page.should have_selector( 'h1', text: "Kitchen Tracker")
    end
  end
end
