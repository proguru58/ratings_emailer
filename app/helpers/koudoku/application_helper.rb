module Koudoku
  module ApplicationHelper

    def plan_price(plan)
      "#{number_to_currency(plan.price)}/#{plan_interval(plan)}"
    end

    def plan_interval(plan)
      case plan.interval
      when "mo"
        "month"
      when "year"
        "year"
      when "week"
        "week"
      when "6-month"
        "half-year"
      when "3-month"
        "quarter"
      else 
        "mo"
      end
    end
    
    # returns TRUE if the controller belongs to Koudoku
    # false in all other cases, for convenience when executing filters 
    # in the main application
    def koudoku_controller? 
      is_a? Koudoku::ApplicationController
    end
  end
end
