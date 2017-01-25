class User < ApplicationRecord
# Added by Koudoku.
  has_one :subscription

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :templates
  has_many :sender_addresses
  has_many :messages

  def subscribed?
    if self.subscription
      self.subscription.plan.present?
    else
      false
    end
  end
end
