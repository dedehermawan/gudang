class ItemsController < ApplicationController

  before_action :all_order, only: [:index, :create, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :destroy]

  def all_order
    #sleep 1
    @per_page = params[:row_per_page] 
    @items = Item.paginate(:per_page => @per_page, :page => params[:page]).order(item_id: :asc)
  end

  def index
    respond_to do |format|
      format.html
      format.js
    end
  end

  def page
    @row_per_page = params[:row_per_page]
    @items = Item.paginate(:per_page => @row_per_page, :page => params[:page]).order(item_id: :asc)
  end

  def new
    @item = Item.new
    @brand = Brand.all
    @unit = Unit.all
  end

  def create
    #render :text => params[:item][:category_item]
    @item = Item.new(item_params)
    @item_id = auto_number(@item.category_item)
    #@item_id = auto_number(params[:item][:category_item])
    @item.item_id = @item_id  #menambahkan ke field database tanpa post dari form
    @item.save
  end

  def edit
    @brand = Brand.all
    @unit = Unit.all
  end

  def update
    @item.update_attributes(item_params)
  end


  def brands
    @brands = Brand.all.order(brand_name: :asc)
  end

  def show
    render :text => auto_number(1)
  end

  def delete
    @item = Item.find(params[:item_id])
  end

  def destroy
    @item.destroy
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :unit_id, :brand_id, :category_item, :category_usage, :active)
  end

  def set_item
    @item = Item.find(params[:id])
  end


  def auto_number(category_item)
    unless category_item.nil?
      @row = Item.select(:item_id).where(category_item: category_item).order(item_id: :desc).first

      item_category_array = ["","E","M","U","W"]
      kode = item_category_array[category_item]
      #kode = item_category_array[category_item.to_i] #menggunakan params[:item][:category_item] di convert dari string ke integer

      unless @row.nil?
        @no_urut = @row.item_id[1,3].to_i  + 1 #convert string to integer lalu di tambah 1
        #@hasil = "W#{format("%.3d",@no_urut)}"
        @hasil = "#{kode}#{"%.3d" % @no_urut}"    #bisa pake titik/0
      else
        @hasil = "#{kode}001"
      end
      return @hasil
    end
  end


end
