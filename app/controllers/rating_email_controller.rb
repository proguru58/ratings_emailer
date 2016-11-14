class RatingEmailController < ApplicationController
  def index
  end

  def send_email
    params[:ratings_email]
    flash[:notice] = '5 Stars rating email sent'
    redirect_to rating_email_index_path
  end
end
