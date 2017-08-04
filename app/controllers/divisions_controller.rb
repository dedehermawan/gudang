class DivisionsController < ApplicationController

  before_action :all_order, only: [:index, :create, :update, :destroy]
  before_action :set_division, only: [:show, :edit, :update, :destroy]

  def all_order
    @divisions = Division.all.order(division_name: :asc)
  end

  def index
  end

  def new
    @division = Division.new
  end

  def create
    @division = Division.create(division_params)
  end

  def show
  end

  def edit
  end

  def update
    @division.update_attributes(division_params)
  end

  def delete
    @division = Division.find(params[:division_id])
  end

  def destroy
    @division.destroy
  end

  private
  def division_params
    params.require(:division).permit(:division_id, :division_name)
  end

  def set_division
    @division = Division.find(params[:id])
  end

end
