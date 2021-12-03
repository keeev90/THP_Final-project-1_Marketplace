class UsersController < ApplicationController
  before_action :authenticate_user!, :check_user

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
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

  private

  def check_user
    if current_user != User.find(params[:id])
      flash[:warning] = "Cha-lut ! Tu n'as pas accès à un compte qui n'est pas le tien ⛔"
      redirect_to root_path
    end
  end
end
