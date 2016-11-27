class RatingEmailController < ApplicationController
  def index
  end

  def send_email
    content = params[:rating_email][:html]
    RatingsMailer.send_ratings(params[:rating_email][:emails], params[:rating_email][:subject], content, current_user.positive_rating_link, current_user.negative_rating_link).deliver

    flash[:notice] = 'Email sent with 5 stars rating attached'
    redirect_to rating_email_index_path
  end
end
