class MyprofilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    
    edited_user = params[:user]

    if @user.update(first_name: edited_user[:first_name], last_name: edited_user[:last_name])
      flash[:success] = "Cha-peau l'artiste ! Ton profil a été modifié avec succès 😎"
      redirect_to user_path(@user)
    else
      flash.now[:warning] = @user.errors.full_messages
      render edit_user_path(@user)
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "Ton compte a été supprimé avec succès. On espère te revoir très vite. Cha-o ! 👋"
    redirect_to root_path
  end
end
