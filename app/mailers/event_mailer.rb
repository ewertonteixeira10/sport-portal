# Sends mails for events: event_canceled, event_started, event_finished
class EventMailer < ApplicationMailer
  after_action :prevent_delivery_to_unsubscribed_users

  def send_mail(user, event, template)
    @user = user
    @event = event

    mail(to: user.email,
         subject: t("event_mailer.#{template}.subject")) do |format|
      format.html { render template }
      format.text { render template }
    end
  end
end