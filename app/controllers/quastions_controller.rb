class QuastionsController < ApplicationController
  # GET /quastions
  # GET /quastions.json
  
  skip_before_filter :admin , :except => :edit  
 
  
  def best_quastions
    @best_quastions = Quastion.order('rate desc').paginate(:page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: @best_quastions }
    end
    
  end
  
  
  def index
    
    @potential_quastions = Quastion.potential
    @quastion = Quastion.new
    @quastions = Quastion.where(pass: true)
    @potential_quastions_newest = Quastion.potential.last(10)
    @potential_quastions_top10 = Quastion.potential.order('rate desc').limit(10)
    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: @quastions }
    end
  end

  def incriment
    @potential_quastions = Quastion.potential
    @potential_quastions_newest = Quastion.potential.last(10)
    @potential_quastions_top10 = Quastion.potential.order('rate desc').limit(10)
    @quastion = Quastion.find(params[:id])
    @quastion.rate =  @quastion.rate + 1
    @quastion.agree_quastions << AgreeQuastion.new(user_id: current_user.id)
    respond_to do |format|
      if @quastion.save	
	format.html { redirect_to quastions_path }
	format.js
	format.json { render json: @quastion }
      end
    end
  end
    
    
  # GET /quastions/1
  # GET /quastions/1.json
  def show
    @quastion = Quastion.find(params[:id])
    @thought = Thought.new
    @thoughts = @quastion.thoughts
    @thoughts_newest = @quastion.thoughts.last(20)
    @thoughts_top20 = @quastion.thoughts.order('rate desc').limit(20)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quastion }
    end
  end

  # GET /quastions/new
  # GET /quastions/new.json
  def new
    @quastion = Quastion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quastion }
    end
  end

  # GET /quastions/1/edit
  def edit
    @quastion = Quastion.find(params[:id])
  end

  # POST /quastions
  # POST /quastions.json
  def create
    current_user.quastions << Quastion.new(params[:quastion])
    @potential_quastions = Quastion.potential
    @potential_quastions_newest = Quastion.potential.last(10)
    @potential_quastions_top10 = Quastion.potential.order('rate desc').limit(10)
    respond_to do |format|
      if current_user.save
        format.html { redirect_to quastions_path, notice: 'Quastion was successfully created.' }
        format.js
	format.json { render json: current_user.quastions.last, status: :created, location: @quastion }
      else
        format.html { render action: "new" }
        format.json { render json: current_user, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quastions/1
  # PUT /quastions/1.json
  def update
    @quastion = Quastion.find(params[:id])

    respond_to do |format|
      if @quastion.update_attributes(params[:quastion])
        format.html { redirect_to @quastion, notice: 'Quastion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quastion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quastions/1
  # DELETE /quastions/1.json
  def destroy
    @quastion = Quastion.find(params[:id])
    @quastion.destroy

    respond_to do |format|
      format.html { redirect_to quastions_url }
      format.json { head :no_content }
    end
  end
end
