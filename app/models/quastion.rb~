class Quastion < ActiveRecord::Base
  
  after_save :change_pass
  attr_accessible :discription, :image, :rate, :topic, :pass, :image_cache
  belongs_to :user, foreign_key: :user_id 
  has_many :thoughts, foreign_key: :quastion_id
  mount_uploader :image, ImageUploader
  validates :discription, :presence => true
  scope :potential, where(pass: nil)
  has_many :agree_quastions
  
  def can_agree(user)
    if agree_quastions.where(user_id: user.id) == []
      return true
    else
      return false
    end
  end
  
  def change_pass
    if self.rate == 115 and self.pass == false
      self.pass = true
      self.save
    end
  end
  
  self.per_page = 10
  
  scope :winners, lambda { where( 'created_at > ? ', 1.day.ago).order('rate desc').limit(3) }
  def Quastion.midnight
    @last_quastions = Quastion.where('pass == ?', true)
    @last_quastions.each do |last_quastion|
      last_quastion.pass = false
      last_quastion.save 
      
    end
    @new_quastions = Quastion.winners
    @new_quastions.each do |new_quastion|
      new_quastion.pass = true
      new_quastion.user.rate += 10
      new_quastion.save
    end 
    
    @quastions_losers = Quastion.where(pass: nil)
    @quastions_losers.each do |lose_quastion|
      lose_quastion.destroy
    end

  end
  
end
