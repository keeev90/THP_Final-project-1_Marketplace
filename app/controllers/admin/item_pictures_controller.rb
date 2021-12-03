class Admin::ItemPicturesController < Admin::BoardController
  #Callbacks
  before_action :authenticate_user!
  before_action :is_admin?

  def create
    @item = Item.find(params[:item_id])
    unless params[:item_picture]
      @item.errors.add(:item_picture, 'Fichier non reconnu')
      flash.now[:warning] = "Fichier non reconnu. Try again !"
      render :create
      return
    end
    @item.item_picture.attach(params[:item_picture])
    flash[:success] = "L'image a bien été ajoutée 😎"
    redirect_to(admin_item_path(@item))
  end

end
