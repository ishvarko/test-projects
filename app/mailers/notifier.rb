class Notifier < ActionMailer::Base
  default :from => "ishvarko@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.ticked_created.subject
  #
  def ticked_created(ticket)
    @ticket = ticket

    mail :to => ticket.customer_email, :subject => 'Your issue is created'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.ticket_updated.subject
  #
  def ticket_updated(ticket,change)
    @ticket = ticket
    @change = change

    mail :to => ticket.customer_email, :subject => "Your issue #{@ticket.number} is updated"
  end
end
