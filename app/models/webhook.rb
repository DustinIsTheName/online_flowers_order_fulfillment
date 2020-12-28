class Webhook < ActiveRecord::Base

  serialize :body, JSON

  validates :hook_id, uniqueness: true
  
end
