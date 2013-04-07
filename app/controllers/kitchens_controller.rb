class KitchensController < ApplicationController

  def index
    @kitchens = Kitchen.all
  end

  def new
    @kitchen = Kitchen.new()
  end

  def create
    @kitchen = Kitchen.new(params[:kitchen])
    if @kitchen.save
      flash[:success] = "Kitchen Created."
      redirect_to root_path
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
end
