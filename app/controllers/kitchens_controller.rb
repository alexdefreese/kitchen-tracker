class KitchensController < ApplicationController

  before_filter :require_authentication, only: [:index, :subscribe_form, :subscribe, :unsubscribe, :new, :create, :show, :update, :destroy]
  before_filter :user_subscribed, only: [:show, :edit, :update, :destroy]

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
    @kitchen = Kitchen.new(params[:kitchen])
    if @kitchen.save
      current_user.kitchens << @kitchen
      if current_user.primary_kitchen_id.nil?
        current_user.primary_kitchen_id = @kitchen.id
        current_user.save
      end
      redirect_to @kitchen, success: "Successfully created new kitchen."
    else
      render :new
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

  private
    def require_authentication
      if not user_signed_in?
        redirect_to root_path
      end
    end

    def user_subscribed
      if not current_user.kitchens.includes(Kitchen.find(params[:id]))
        redirect_to root_path
      end
    end
end
