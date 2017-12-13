class SuppliersController < ApplicationController
  
  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @suppliers = Supplier.all.order(supplier_name: :asc)
    @supplier = Supplier.create(supplier_params)
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @suppliers = Supplier.all.order(supplier_name: :asc)
    @supplier = Supplier.find(params[:id])

    @supplier.update_attributes(supplier_params)
  end

  def delete
    @supplier = Supplier.find(params[:supplier_id])
  end

  def destroy
    @suppliers = Supplier.all.order(supplier_name: :asc)

    @supplier = Supplier.find(params[:id])

    @supplier.destroy

  end



  private
  def supplier_params
    params.require(:supplier).permit(:supplier_name)
  end
end
