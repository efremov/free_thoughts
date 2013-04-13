class PersonalInfo < ActiveRecord::Base
  attr_accessible :age, :country, :credo, :gender, :image, :marital_status, :image_cache,:name, :political_views, :religion, :smf_more, :surname
  belongs_to :user, foreign_key: :user_id 
  mount_uploader :image, ImageUploader
  self.per_page = 10
end
