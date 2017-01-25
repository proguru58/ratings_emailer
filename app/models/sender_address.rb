class SenderAddress < ApplicationRecord
  belongs_to :user

  after_create :ses_verify_address

  def ses
    raise 'No SES_ACCESS_KEY ENV variable is set' unless ENV['AMAZON_ACCESS_KEY']
    raise 'No SES_SECRET_KEY ENV variable is set' unless ENV['AMAZON_SECRET_KEY']

    ses = AWS::SES::Base.new :access_key_id => ENV['AMAZON_ACCESS_KEY'], :secret_access_key => ENV['AMAZON_SECRET_KEY']
  end

  def ses_verify_address
    unless ses_verified
      ses.addresses.verify(self.email)
    end
  end

  def ses_verified
    ses.addresses.list.result.include?(self.email)
  end
end
