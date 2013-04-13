class Folower < ActiveRecord::Base
  attr_accessible :user_id, :thinker_id
  belongs_to :user, foreign_key: :user_id 
end
