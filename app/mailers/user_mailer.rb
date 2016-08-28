class UserMailer < ApplicationMailer
  default from: "findlife17@gmail.com"
  def signup_confirmation(user)
    @user = user
    @greeting = "Hey there"

    mail to: user.email, subject: "Sign Up Confirmation"
  end
end
