class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart = Cart.find(params[:cart])

    @items = @cart.join_table_item_carts.map do |ordered_item|
      {
        price: ordered_item.item.stripe_price.id,
        quantity: ordered_item.quantity
      }
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: @items,
      mode: 'payment',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    respond_to do |format|
      format.js # renders create.js.erb
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    puts "#" * 60
    puts @session
    puts "#" * 60
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    puts "#" * 60
    puts @payment_intent
    puts "#" * 60
    @order = Order.create(user: current_user) if @session.payment_status = "paid"
    puts "#" * 60
    puts @order
    puts "#" * 60
  end

  def cancel
  end
end
