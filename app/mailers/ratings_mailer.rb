class RatingsMailer < ApplicationMailer
  def send_ratings(to_addresses, subject, content, token)
    @token = token
    @content = content
    mail(:to => to_addresses, :subject=>subject)
  end
end
