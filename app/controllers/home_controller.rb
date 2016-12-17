class HomeController < ApplicationController
  before_action :subscription_required

  def index
  end
end
