class HousesController < ApplicationController

  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
    @members = @house.members
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    if @house.save
      redirect_to @house, notice: "House added successfully"
    else
      flash[:notice] = "Failed to save House."
      render :new
    end
  end


  private

  def house_params
    params.require(:house).permit(:name, :author, :source, :motto)
  end

end
