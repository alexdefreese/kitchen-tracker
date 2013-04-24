require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "Kitchens" do
  let (:user) { FactoryGirl.create(:user) }

  describe 'GET /kitchens/new' do

    it "should display the New Kitchens Page" do
      login_as( user, scope: :user )
      visit new_kitchen_path
      page.should have_selector( 'h1', text: 'New Kitchen' )
    end

    it "should redirect to login if not logged in" do
      
    end

  end
  
end
