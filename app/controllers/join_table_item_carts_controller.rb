class JoinTableItemCartsController < ApplicationController
  def create
    JoinTableItemCart.create(cart: current_user.cart, item: Item.find(params[:id]))
    flash[:success] = "La photo est bien ajoutée à ton cha-riot ✨"

    @id = params[:id]
    @cart_items_count = current_user.cart.items.count
    
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { flash[:success] = "La photo est bien ajoutée à ton cha-riot ✨" }
    end
  end

  def destroy
    @item = JoinTableItemCart.find_by(cart: current_user.cart, item: Item.find(params[:id]))
    @item.destroy

    @id = params[:id]
    @cart_items_count = current_user.cart.items.count
    @total_amount = current_user.cart.total_price
    @empty_cart = current_user.cart.items.length

    respond_to do |format|
      format.html { redirect_to mycart_path }
      format.js
    end
  end

  def update
    @item = JoinTableItemCart.find_by(cart: current_user.cart, item: Item.find(params[:id]))
    increment = params[:increment].to_i
    @item.update(quantity: @item.quantity + increment)

    @id = params[:id]
    @quantity = @item.quantity
    @total_amount = current_user.cart.total_price

    respond_to do |format|
      format.html { redirect_to mycart_path }
      format.js
    end
  end
end
