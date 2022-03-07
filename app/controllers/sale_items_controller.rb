class SaleItemsController < ApplicationController
  before_action :set_sale_item, only: [:show, :edit, :update, :destroy]

  # GET /sale_items
  def index
    @sale_items = SaleItem.all
  end

  # GET /sale_items/1
  def show
  end

  # GET /sale_items/new
  def new
    @sale_item = SaleItem.new
  end

  # GET /sale_items/1/edit
  def edit
  end

  # POST /sale_items
  def create
    @sale_item = SaleItem.new(sale_item_params)

    if @sale_item.save
      redirect_to @sale_item, notice: 'Sale item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sale_items/1
  def update
    if @sale_item.update(sale_item_params)
      redirect_to @sale_item, notice: 'Sale item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sale_items/1
  def destroy
    @sale_item.destroy
    redirect_to sale_items_url, notice: 'Sale item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_item
      @sale_item = SaleItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sale_item_params
      params.require(:sale_item).permit(:sale_price, :item_status, :seller_id, :buyer_id, :item_title, :location, :photo_link, :item_description, :item_category)
    end
end
