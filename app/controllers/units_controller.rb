class UnitsController < ApplicationController

  def index
    @units = Unit.all.order(unit_name: :asc)
  end

  def new
    @unit = Unit.new
  end

  def create
    @units = Unit.all.order(unit_name: :asc)
    @unit = Unit.create(unit_params)
  end

  def edit
    @unit = Unit.find(params[:id])
  end

  def update
    @units = Unit.all.order(unit_name: :asc)
    @unit = Unit.find(params[:id])

    @unit.update_attributes(unit_params)
  end

  def delete
    @unit = Unit.find(params[:unit_id])
  end

  def destroy
    @units = Unit.all.order(unit_name: :asc)

    @unit = Unit.find(params[:id])

    @unit.destroy

  end


  private
  def unit_params
    params.require(:unit).permit(:id, :unit_name)
  end

end
