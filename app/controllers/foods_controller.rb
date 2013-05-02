class FoodsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @kitchen = Kitchen.find(params[:kitchen_id])
    @food = @kitchen.foods.build
  end

  def create
    @kitchen = Kitchen.find(params[:kitchen_id])
    @food = @kitchen.build(params[:food])
    flash[:notice] = "Food Created"
    respond_to do |type|
      type.html { redirect_to @kitchen }
      type.js
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
