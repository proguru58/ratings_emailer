class MessagesController < ApplicationController
  before_action :subscription_required

  def index
    @messages = current_user.messages
  end
end
