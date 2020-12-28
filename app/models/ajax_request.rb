class AjaxRequest < ActiveRecord::Base

  serialize :body, JSON

end
