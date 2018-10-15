class MembersController < ApplicationController

  def new
    @house = House.find(params[:house_id])
    @member = Member.new
    @member.house = @house
    @members = @house.members
  end

  def create
    @house = House.find(params[:house_id])
    @member = Member.new(member_params)
    @member.house = @house
    @members = @house.members

    if @member.save
      flash[:notice] = "Member added successfully"
      redirect_to house_path(@house)
    else
      flash[:notice] = "Failed to save Member"
      render :new
    end
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name)
  end

end
