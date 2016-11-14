class RatingsMailer < ApplicationMailer
  def send_ratings(options={})
    @name = options[:name]
    @email = options[:email]
    @message = options[:message]
    mail(:to=>options[:to], :subject=>"Hotel Ratings")
  end
end
