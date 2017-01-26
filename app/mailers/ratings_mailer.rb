class RatingsMailer < ApplicationMailer
  def send_ratings(to_addresses, subject, content, token, member)
    @token = token
    @content = content
    @member = member.id
    mail(:to => to_addresses, :from => "Custom <#{member.sender_addresses[0].email}>", :subject=>subject)
  end
end
