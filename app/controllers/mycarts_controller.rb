class MycartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @cart = @user.cart
    @total_amount = @cart.total_price()
    @items = @cart.items
  end
end
