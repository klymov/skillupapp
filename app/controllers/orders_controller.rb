class OrdersController < ApplicationController
  

  def index
    @order = Order.all
  end

  def new
    # binding.pry
    authorize! Order.new, context: { user: @current_user } #
    OrderPolicy.new(user: @current_user).allowed_to?(:new?) #

    @order = Order.new
  end

  def show
    @order = Order.find_by_id(params[:id])
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
    @order = Order.find_by_id(params[:id])
    not_found if @order.nil?
  end

  def update
    @order = Order.find_by_id(params[:id])
    not_found if @order.nil?

    if @order.update(order_params)
      redirect_to @order
    else
      render 'edit'
    end
  end

  def destroy
    @order = Order.find_by_id(params[:id])
    not_found if @order.nil?
    @order.destroy
    redirect_to orders_path
  end

  def assignment
    @order = Order.find_by_id(params[:id])
    not_found if @order.nil?
    if @order.update(order_status)
      redirect_to @order
    else
      render 'index'
    end
  end


  private
  def order_params
    params.require(:order).permit(:passenger, :driver, :status, :description)
  end

  def order_status
    params.permit(:id, :status)
  end
end
