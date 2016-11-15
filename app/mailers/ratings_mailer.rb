class RatingsMailer < ApplicationMailer
  def send_ratings(from_address, to_addresses, content, positive_rating_link, negative_rating_link)
    @content = content
    @positive_rating_link = positive_rating_link
    @negative_rating_link = negative_rating_link
    mail(:from => from_address, :to => to_addresses, :subject=>"Hotel Ratings")
  end
end
