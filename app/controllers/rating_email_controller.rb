class RatingEmailController < ApplicationController
  before_action :subscription_required

  def index
    @templates = current_user.templates
  end

  def send_email
    content = params[:rating_email][:html]
    email = params[:rating_email][:emails]
    customer = params[:rating_email][:customer]
    subject = params[:rating_email][:subject]
    token =  SecureRandom.urlsafe_base64(nil, false)

    content = content.sub("{{Customer Name}}", customer)

    RatingsMailer.send_ratings(email, subject, content, token, current_user).deliver

    message = Message.create(:content => content, :email => email, :subject => subject, :status => 'delivered', :token => token)
    message.user = current_user
    message.save

    flash[:notice] = 'Email sent with 5 stars rating attached'
    redirect_to rating_email_index_path
  end
end
