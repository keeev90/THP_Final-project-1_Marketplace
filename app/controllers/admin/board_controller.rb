class Admin::BoardController < ApplicationController
  #Callbacks
  before_action :authenticate_user!
  before_action :is_admin?

  def index
    @orders = Order.all
    @sum = 0
  end

end
