class AgreeThought < ActiveRecord::Base
   attr_accessible :user_id, :thought_id
   belongs_to :thought
end
