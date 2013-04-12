class Thought < ActiveRecord::Base
  before_save :add_rating_to_comment
  attr_accessible :point, :quastion_id, :rate, :user_id
  validates :point, :presence => true
  belongs_to :user, foreign_key: :user_id
  belongs_to :quastion, foreign_key: :quastion_id
  has_many :agree_thoughts
  self.per_page = 10
  
  
  def add_rating_to_comment
    @quastion = Quastion.find(quastion_id)
    @quastion.rate = @quastion.rate + 1
    @quastion.save
  end 
  
 def increase_rate
    self.rate += 1
    @user = user
    @user.rate += 1
    self.save
    @user.save
 end
 
  def can_agree(user)
    if agree_thoughts.where(user_id: user.id) == []
      return true
    else
      return false
    end
  end
 
 def Thought.best_thoughts_of_the_day
    @foo = []
    Quastion.where(pass: false).last(4).each do |quastion|
      @foo << quastion.thoughts.order('rate desc').first
    end
    @foo
  end
   
  
end
