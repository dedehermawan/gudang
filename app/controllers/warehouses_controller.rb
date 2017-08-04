class WarehousesController < ApplicationController
  
  def index
    @warehouses = Warehouse.all
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouses = Warehouse.all.order(warehouse_name: :asc)
    @warehouse = Warehouse.create(warehouse_params)
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    @warehouses = Warehouse.all.order(warehouse_name: :asc)
    @warehouse = Warehouse.find(params[:id])

    @warehouse.update_attributes(warehouse_params)
  end

  def delete
    @warehouse = Warehouse.find(params[:warehouse_id])
  end

  def destroy
    @warehouses = Warehouse.all.order(warehouse_name: :asc)

    @warehouse = Warehouse.find(params[:id])

    @warehouse.destroy

  end



  private
  def warehouse_params
    params.require(:warehouse).permit(:id, :warehouse_name)
  end
end
