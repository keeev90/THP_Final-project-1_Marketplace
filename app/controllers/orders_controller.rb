class OrdersController < ApplicationController
  before_action :authenticate_user!, :check_order
 
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  # def new
  # end

  # In Stripe payment process :
  #def create
  #  if current_user.cart.join_table_item_carts.size >= 1
  #    order = Order.create(user: current_user)
  #    redirect_to order_path(order)
  #  else
  #    redirect_to root_path
  #  end
  #end

  def show
    @order = Order.find(params[:id])
  end
  # #For admin only :
  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def check_order
    test = Order.find(params[:id]).user rescue nil
    if test != current_user
      flash[:warning] = "Cha-perlipopette ! Cette commande n'est pas la tienne ⛔"
      redirect_to root_path
    end
  end

end
