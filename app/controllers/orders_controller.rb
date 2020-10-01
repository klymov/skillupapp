class OrdersController < ApplicationController
  @title = ''

  def index
  end

  def new
    @title = 'New Order'
    # @person = Person.new
  end
  
  def show
    @order = Order.find(params[:id])
  end

  def create
    #render plain: params[:order].inspect 
    @order = Order.new(order_params)
    @order.save
    redirect_to @order
  end


  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private
  def order_params
    params.require(:order).permit(:login, :phone, :description)
  end


end
