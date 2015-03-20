class NewPartyMailer < ActionMailer::Base
  default from: "concierge@partyof4.com"
  layout "email"

  def new_party_email(party)
    @party = party
    @url = admin_party_url(@party)
    mail(to: "concierge@partyof4.com", subject: "New signup from #{@party.email}")
  end
end
