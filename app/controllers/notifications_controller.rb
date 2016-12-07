class NotificationsController < ApplicationController
  skip_before_action :authenticate_user!

  def track_email_open
    @message = Message.find_by_token(params[:message_token_id])
    @message.mark_as_read unless @message.nil?

    respond_to do |format|
      begin
        format.gif { render :text => 'Here' }
      rescue
        format.any { render :template => 'application/errors/404', :status => :not_found }
      end
    end
  end
end
