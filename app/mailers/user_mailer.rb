class UserMailer < ApplicationMailer
	default from: 'rdha444@gmail.com'
 
  def welcome_email()
    @url  = 'http://example.com/login'
    mail(to: "rrdharmesh@gmail.com", subject: 'Welcome to My Awesome Site')
  end
end
