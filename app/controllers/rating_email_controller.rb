class RatingEmailController < ApplicationController
  def index
    @templates = current_user.templates
    @messages = current_user.messages
  end

  def send_email
    content = params[:rating_email][:html]
    email = params[:rating_email][:emails]
    subject = params[:rating_email][:subject]
    token =  SecureRandom.urlsafe_base64(nil, false)
    message = Message.create(:content => content, :email => email, :subject => subject, :status => 'delivered', :token => token)
    message.user = current_user
    message.save

    RatingsMailer.send_ratings(email, subject, content, token, current_user.positive_rating_link, current_user.negative_rating_link).deliver

    flash[:notice] = 'Email sent with 5 stars rating attached'
    redirect_to rating_email_index_path
  end
end
