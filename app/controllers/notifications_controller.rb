class NotificationsController < ApplicationController
  def track_email_open
    @message = Message.find_by_token(params[:message_token_id])
    @message.mark_as_read unless @message.nil?

    filename = params[:filename].gsub(/[^a-zA-Z0-9_]/,'')

    respond_to do |format|
      begin
        file_path = "../../../assets/images/#{filename}.#{params[:format]}"
        file = File.open(File.expand_path(file_path, __FILE__))
        format.gif { render :text => file.read }
      rescue
        format.any { render :template => 'application/errors/404', :status => :not_found }
      end
    end
  end
end
