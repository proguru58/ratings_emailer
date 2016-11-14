class RatingsMailer < ApplicationMailer
  def send_email(options={})
    @name = options[:name]
    @email = options[:email]
    @message = options[:message]
    mail(:to=>options[:to], :subject=>"Hotel Ratings")
  end
end
