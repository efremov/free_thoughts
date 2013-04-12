class GreatThought < ActiveRecord::Base
  attr_accessible :author, :quotation, :been
  
  def GreatThought.today_great
    GreatThought.where(been: false).first 
  end
  
  def GreatThought.midnight       
    @today_great_thought = GreatThought.today_great
    @today_great_thought.been = true
    @today_great_thought.save
  end
end
