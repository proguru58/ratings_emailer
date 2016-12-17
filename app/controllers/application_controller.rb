class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:negative_rating_link, :positive_rating_link])
  end

  def subscription_required
    if current_user.subscription
      return true if current_user.subscription.plan.present?
    end

    redirect_to koudoku.owner_subscriptions_path(current_user)
  end
end
