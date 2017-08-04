class BrandsController < ApplicationController

  before_action :all_order, only: [:index, :create, :update, :destroy]
  before_action :set_brand, only: [:edit, :update, :destroy]

  def all_order
    @brands = Brand.all.order(brand_name: :asc)
  end

  def index
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.create(brand_params)
  end

  def edit
  end

  def update
    @brand.update_attributes(brand_params)
  end

  def delete
    @brand = Brand.find(params[:brand_id])
  end

  def destroy
    @brand.destroy

  end


  private
  def brand_params
    params.require(:brand).permit(:id, :brand_name)
  end

  def set_brand
    @brand = Brand.find(params[:id])
  end

end
