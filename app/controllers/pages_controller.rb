class PagesController < ApplicationController
  def home
    if user_signed_in?
      if not current_user.primary_kitchen_id.nil?
        redirect_to Kitchen.find(current_user.primary_kitchen_id)
      end
    end
  end

  def help
  end
end
