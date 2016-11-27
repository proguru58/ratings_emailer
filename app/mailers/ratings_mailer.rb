class RatingsMailer < ApplicationMailer
  def send_ratings(to_addresses, subject, content, positive_rating_link, negative_rating_link)
    @content = content
    @positive_rating_link = positive_rating_link
    @negative_rating_link = negative_rating_link
    mail(:to => to_addresses, :subject=>subject)
  end
end
