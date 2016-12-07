class NotificationsController < ApplicationController
  skip_before_action :authenticate_user!

  def track_email_open
    @message = Message.find_by_token(params[:message_token_id])
    @message.mark_as_read unless @message.nil?

    respond_to do |format|
      begin
        format.gif { send_data(Base64.decode64("R0lGODlhAQABAPAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="), :type => "image/gif", :disposition => "inline") }
      rescue
        format.any { render :template => 'application/errors/404', :status => :not_found }
      end
    end
  end

  def rating
    member = User.find(params[:member])
    case params[:stars]
    when '1', '2', '3'
      redirect_to member.negative_rating_link
    else
      redirect_to member.positive_rating_link
    end
  end
end
