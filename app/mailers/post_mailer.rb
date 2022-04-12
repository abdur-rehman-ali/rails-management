class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_created.subject
  #
  def post_created
    @greeting = "Hi, Thanks for joining"

    mail(
       from: 'support@gmail.com',
       to: Student.first.email , 
       cc: Student.all.pluck(:email) , 
       bcc: "secret@gmail.com", 
       subject: 'New post'
    )
  end
end
