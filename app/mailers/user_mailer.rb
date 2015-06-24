class UserMailer < ActionMailer::Base
  default from: "no-reply@toucan.com"


  def welcome_email(user)
    @user = user
    @url  = 'localhost:3000'
    mail(to: 'abelbezu@mit.edu', subject: 'Welcome to My Awesome Site')
  end

  #sends an invitation email to the specified reciever
  #@param Account sender --> Account sending the email
  #@param Account reciever --> the account to which the email is sent to
  #@param Debate debate --> the debate ..
  def invitation_email(sender, reciever, topic)
  	@sender = sender
  	@reciever = reciever
  	@topic = topic
  	mail(to: reciever.email, subject: 'Invitation for Debate')
  end

  def invitation_by_email(sender, reciever_email, topic)
    @sender = sender
    @reciever_email = reciever_email
    @topic = topic
    mail(to: reciever_email, subject: 'Invitation for Debate')
  end

  def notification_email(reciever,message, url)
  	@reciever = reciever
  	@url = url
  	@message = message
  	mail(to: reciever.email, subject: 'Notification')
  end


end
