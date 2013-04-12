class AgreeQuastion < ActiveRecord::Base
   attr_accessible :quastion_id, :user_id
   belongs_to :quastion
end
