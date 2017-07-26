# == Schema Information
#
# Table name: sales
#
#  id          :integer          not null, primary key
#  item_id     :integer
#  customer_id :integer
#  date        :date
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#  updated_at  :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#

class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all

    render json: @sales
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    render json: @sale
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      render json: @sale, status: :created, location: @sale
    else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    @sale = Sale.find(params[:id])

    if @sale.update(sale_params)
      head :no_content
    else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy

    head :no_content
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:item_id, :customer_id, :date, :quantity, :price)
  end
end
