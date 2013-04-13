class GreatThoughtsController < ApplicationController




  def new
    @great_thought = GreatThought.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @great_thought }
    end
  end


  def create
  @great_thought = GreatThought.new(params[:great_thought])
    
    respond_to do |format|
      if @great_thought.save
        format.html { redirect_to quastions_path, notice: 'Great thought was successfully created.' }
        format.js
	format.json { render json: @great_thought, status: :created, location: @quastion }
      else
        format.html { render action: "new" }
        format.json { render json: @great_thought, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @great_thought = GreatThought.find(params[:id])
    @great_thought.destroy

    respond_to do |format|
      format.html { redirect_to quastions_path }
      format.json { head :no_content }
    end
  end
end