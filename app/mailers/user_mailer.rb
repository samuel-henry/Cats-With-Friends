class UserMailer < ActionMailer::Base
  default from: "admin@catswithfriends.com"

  def welcome_email(user)
  	@user = user
  	mail(:to => user.email, :subject => "Welcome to Cats With Friends!")
  end

end
