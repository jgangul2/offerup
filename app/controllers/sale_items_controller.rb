class SaleItemsController < ApplicationController
  before_action :set_sale_item, only: %i[show edit update destroy]

  def index
    @q = SaleItem.ransack(params[:q])
    @sale_items = @q.result(distinct: true).includes(:category, :seller,
                                                     :buyer).page(params[:page]).per(10)
  end

  def show; end

  def new
    @sale_item = SaleItem.new
  end

  def edit; end

  def create
    @sale_item = SaleItem.new(sale_item_params)

    if @sale_item.save
      message = "SaleItem was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @sale_item, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @sale_item.update(sale_item_params)
      redirect_to @sale_item, notice: "Sale item was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @sale_item.destroy
    message = "SaleItem was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to sale_items_url, notice: message
    end
  end

  private

  def set_sale_item
    @sale_item = SaleItem.find(params[:id])
  end

  def sale_item_params
    params.require(:sale_item).permit(:sale_price, :item_status, :seller_id,
                                      :buyer_id, :item_title, :location, :photo_link, :item_description, :item_category)
  end
end
