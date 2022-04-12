class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_created.subject
  #
  def post_created
    @name = params[:user]
    @greeting = "Hi, Thanks for joining"

    email_with_name = %("#{Student.first.name}" <#{Student.first.email}>)

    attachments['image.jpg'] = File.read('app/assets/images/attach.jpeg')
    mail(
       from: 'support@gmail.com',
      #  to: Student.first.email , 
       to: email_with_name,
       cc: Student.all.pluck(:email) , 
       bcc: "secret@gmail.com", 
       subject: 'New post'
    )
    
  end
end
