class KitchensController < ApplicationController

  def index
    @kitchens = Kitchen.all
  end

  def subscribe_form
    @kitchen = Kitchen.find(params[:id])
  end

  def subscribe
    @kitchen = Kitchen.find(params[:id])
    if params[:auth_code] == @kitchen.auth_code
      if current_user.kitchens.empty?
        current_user.primary_kitchen_id = @kitchen.id
        flash[:success] = "Subscribed to this kitchen"
      end
      current_user.kitchens << @kitchen
      redirect_to 'kitchens#index'
    end
  end

  def unsubscribe
    @kitchen = Kitchen.find(params[:id])
    if user_signed_in? and current_user.kitchens.include?(@kitchen)
      current_user.kitchens.delete(@kitchen)
      redirect_to kitchens_path
    else
      redirect_to kitchens_path
    end
  end

  def new
    @kitchen = Kitchen.new()
  end

  def create
    if user_signed_in?
      current_user.kitchens.build(params[:kitchen])
      if current_user.save
        flash[:success] = "Kitchen Created."
        if current_user.primary_kitchen_id.nil?
          current_user.primary_kitchen_id = current_user.kitchens[1].id
        end
        redirect_to root_path
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  def show
    @kitchen = Kitchen.find(params[:id])
  end

  def edit
    @kitchen = Kitchen.find(params[:id])
  end

  def update
    @kitchen = Kitchen.find(params[:id])
    @kitchen.update_attributes(params[:event])
  end

  def destroy
    @kitchen = Kitchen.find(params[:id])
    @kitchen.destroy
  end
end
