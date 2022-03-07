class Api::V1::SaleItemsController < Api::V1::GraphitiController
  def index
    sale_items = SaleItemResource.all(params)
    respond_with(sale_items)
  end

  def show
    sale_item = SaleItemResource.find(params)
    respond_with(sale_item)
  end

  def create
    sale_item = SaleItemResource.build(params)

    if sale_item.save
      render jsonapi: sale_item, status: :created
    else
      render jsonapi_errors: sale_item
    end
  end

  def update
    sale_item = SaleItemResource.find(params)

    if sale_item.update_attributes
      render jsonapi: sale_item
    else
      render jsonapi_errors: sale_item
    end
  end

  def destroy
    sale_item = SaleItemResource.find(params)

    if sale_item.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: sale_item
    end
  end
end
