class Message < ApplicationRecord

  belongs_to :user

  def mark_as_read
    self.update_column(:status, 'opened')
  end

  def update_rating (stars)
    self.update_column(:rating, stars)
  end
end
