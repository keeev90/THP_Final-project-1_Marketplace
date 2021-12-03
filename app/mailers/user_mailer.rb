class UserMailer < ApplicationMailer
  default from: ENV['EMAIL_FROM']
 
  def welcome_email(user)
    @user = user 
    @url  = "https://poticha-dev.herokuapp.com/users/sign_in" 
    mail(to: @user.email, subject: "Bienvenue sur Poticha ! 🐱") 
  end

  def new_order_email(order)
    @order = order
    @user = order.user
    mail(to: 'potichadmin@yopmail.com', subject: "Nouvelle commande 🎉") #TODO : change current admin email adress in 'potichadmin@yopmail.com' in database
  end

  def order_validation_email(order)
    @order = order
    @user = order.user
    mail(to: @user.email, subject: "Confirmation de votre commande 🐱")
  end

end
