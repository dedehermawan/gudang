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
    @coas     = Coa.all
    @purchase.purchase_details.build
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.purchase_id = "M001"
    if @purchase.save
      redirect_to @purchase
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  private
  def purchase_params
    #params.require(:purchase).permit(:purchase_id, :supplier_id, :coa_id, :document_date, :use_date, purchase_details_attributes: [:purchase_id, :qty_purchase] )
    params.require(:purchase).permit( purchase_details_attributes: [:qty_purchase])
  end

end
