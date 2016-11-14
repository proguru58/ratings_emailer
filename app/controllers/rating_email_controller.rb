class RatingEmailController < ApplicationController
  def index
  end

  def send_email
    content = params[:rating_email][:html]
    RatingsMailer.send_ratings(current_user.email, params[:rating_email][:emails], content).deliver

    flash[:notice] = '5 Stars rating email sent'
    redirect_to rating_email_index_path
  end
end
