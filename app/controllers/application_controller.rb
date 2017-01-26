class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :negative_rating_link, :positive_rating_link])
  end

  def subscription_required
    return true if current_user.subscribed? or current_user.is_admin?

    redirect_to koudoku.owner_subscriptions_path(current_user)
  end
end
