class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :best_thoughts
  before_filter :great_thought
  before_filter :admin
  
  
  def admin
    unless current_user == User.find(1) or params[:controller] == 'devise/sessions' or params[:controller] == 'devise/registrations'               
      redirect_to quastions_path
    end
  end
  
  def best_thoughts
    @best_thoughts = Thought.best_thoughts_of_the_day
  end
  
  def great_thought
    @great_thought = GreatThought.new
    @today_great_thought = GreatThought.today_great
  end
  
end
