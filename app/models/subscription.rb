class Subscription < ApplicationRecord
  include Koudoku::Subscription
  belongs_to :user
end
