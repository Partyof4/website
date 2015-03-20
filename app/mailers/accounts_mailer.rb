class AccountsMailer < ActionMailer::Base
  default from: "concierge@partyof4.com"
  layout "email"

  def reset_password_email(account)
    @account = account
    @url = edit_password_reset_url(account.reset_password_token)
    mail(to: account.email, subject: "Change your Partyof4 password")
  end
end
