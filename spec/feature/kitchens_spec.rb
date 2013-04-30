require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "Kitchens" do
  let (:user) { FactoryGirl.create(:user) }
  let (:kitchen) { FactoryGirl.create(:kitchen) }

  describe 'GET /kitchens/new' do

    it "should display the New Kitchens Page" do
      login_as( user, scope: :user )
      visit new_kitchen_path
      page.should have_selector( 'h1', text: 'New Kitchen' )
    end

    it "should redirect to login if not logged in" do
      visit new_kitchen_path
      page.should have_selector( 'h1', text: 'Kitchen Tracker')
    end

    it "should create a new kitchen" do
      login_as( user, scope: :user)
      visit new_kitchen_path
      fill_in "Name", with: kitchen.name
      fill_in "Description", with: kitchen.description
      fill_in "Auth code", with: kitchen.auth_code
      click_link "Create Kitchen"
      save_and_open_page

      page.should have_selector( 'h1', text: kitchen.name )
    end

  end
  
end
