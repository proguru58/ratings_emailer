class RatingEmailController < ApplicationController
  def index
  end

  def send_email
    content = params[:ratings_email][:html]
    params[:ratings_email][:emails].split(",").map do |s|
      RatingsMailer.send_ratings(name: params[:name], email: s, to: s, message: content).deliver
    end

    flash[:notice] = '5 Stars rating email sent'
    redirect_to rating_email_index_path
  end
end
