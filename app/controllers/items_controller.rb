class ItemsController < ApplicationController
  before_action :isHidden?, only: [:show]

  def index
    @items = Item.all.order('created_at ASC')
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def isHidden?
    @item = Item.find(params[:id])
    if @item.sellable || (user_signed_in? && current_user.is_admin)

    else
      flash[:warning] = "Erreur : Cet article n'est pas disponible. ⛔"
      redirect_to items_path
    end
  end

end
