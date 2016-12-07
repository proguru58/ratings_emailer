class Message < ApplicationRecord

  belongs_to :user

  def mark_as_read
    if self.read_at.nil?
      self.update_column(:status, 'opened')
    end
  end
end
