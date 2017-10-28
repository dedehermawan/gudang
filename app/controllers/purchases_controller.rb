class PurchasesController < ApplicationController
  before_action :all_order, only: [:index, :create, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :destroy]

  def all_order
    sleep 0.5 
    @per_page = params[:limit].present? ? params[:limit].to_i : 5
    @purchases = Purchase.search(params[:search]).paginate(:per_page => @per_page, :page => params[:page]).order(purchase_id: :asc)
  end

  def index
  end

  def add
  end

  def new
    @purchase = Purchase.new    
  end
end
