class CoasController < ApplicationController

  before_action :all_order, only: [:index, :create, :update, :destroy]
  before_action :set_coa, only: [:show, :edit, :update, :destroy]

  def all_order
    @coas = Coa.all.order(coa_name: :asc)
  end

  def index
  end

  def new
    @coa = Coa.new
  end

  def create
    @coa = Coa.create(coa_params)
  end

  def show
  end

  def edit
  end

  def update
    @coa.update_attributes(coa_params)
  end

  def delete
    @coa = Coa.find(params[:coa_id])
  end

  def destroy
    @coa.destroy
  end

  private
  def coa_params
    params.require(:coa).permit(:coa_id, :coa_name)
  end

  def set_coa
    @coa = Coa.find(params[:id])
  end

end
