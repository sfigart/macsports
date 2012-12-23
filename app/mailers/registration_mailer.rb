class RegistrationMailer < ActionMailer::Base
  default from: "palmoanalua@gmail.com"
  
  def registration_complete(registration)
    @registration = registration
    mail(:to => registration.email_address, :subject => "PAL MAC Volleyball Registration Received")
  end
  
  def baseball_agreement(registration)
    @registration = registration
    mail(:to => registration.email_address, :subject => "MAC Baseball Agreement")
  end
end
