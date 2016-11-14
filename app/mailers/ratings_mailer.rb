class RatingsMailer < ApplicationMailer
  def send_ratings(from_address, to_addresses, content)
    @content = content
    mail(:from => from_address, :to => to_addresses, :subject=>"Hotel Ratings")
  end
end
