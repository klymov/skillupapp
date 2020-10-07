class OrdersController < ApplicationController
  def index
    @order = Order.all
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    not_found if @order.nil?
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order
    else
      render 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
    not_found if @order.nil?
  end

  def update
    @order = Order.find(params[:id])
    not_found if @order.nil?

    if @order.update(order_params)
      redirect_to @order
    else
      render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    not_found if @order.nil?
    @order.destroy
    redirect_to orders_path
  end

  private
  def order_params
    params.require(:order).permit(:login, :phone, :description)
  end
end
