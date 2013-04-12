class ThoughtsController < ApplicationController
  # GET /thoughts
  # GET /thoughts.json
  before_filter :only_passed_quastions, :only => :new
  skip_before_filter :admin , :except => :show
  
  def only_passed_quastions
    @current_quastion = Quastion.find(params[:quastion_id])
    unless @current_quastion.pass 
      redirect_to quastions_path, notice: "This quastion can't be commented"
    end
  end
  
  def incriment
    
    @current_quastion = Quastion.find(params[:quastion_id])
    @thought = Thought.find(params[:id])
    @thought.increase_rate
    @thoughts = Thought.where(quastion_id: @thought.quastion_id)
    @thoughts_newest = @current_quastion.thoughts.last(20)
    @thoughts_top20 = @current_quastion.thoughts.order('rate desc').limit(20)
    @thought.agree_thoughts << AgreeThought.new(user_id: current_user.id)
    
    respond_to do |format|
      if @thought.save
	format.html { redirect_to quastion_path(@current_quastion) }
	format.json { render json: @thought }
	format.js
      end
    end
  end
  
  def best_thoughts_ever
    @best_thoughts_ever = Thought.order('rate desc').paginate(:page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: @best_thoughts_ever }
    end
  end
  
  def index
    @current_quastion = Quastion.find(params[:quastion_id])
    @thoughts = @current_quastion.thoughts
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @thoughts }
    end
  end

  # GET /thoughts/1
  # GET /thoughts/1.json
  def show
    @thought = Thought.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thought }
    end
  end

  # GET /thoughts/new
  # GET /thoughts/new.json
  def new
    @thought = Thought.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thought }
    end
  end

  # GET /thoughts/1/edit
  def edit
    @thought = Thought.find(params[:id])
  end

  # POST /thoughts
  # POST /thoughts.json
  def create
    @current_quastion = Quastion.find(params[:quastion_id])
    @thought = @current_quastion.thoughts.build(params[:thought])
    @thoughts = @current_quastion.thoughts
    @thoughts_newest = @current_quastion.thoughts.last(20)
    @thoughts_top20 = @current_quastion.thoughts.order('rate desc').limit(20)
    if user_signed_in?
      @thought.user_id = current_user.id
    end
    

    respond_to do |format|
      if @thought.save
        format.html { redirect_to quastion_path(@current_quastion), notice: 'Thought was successfully created.' }
        format.json { render json: @thought, status: :created, location: @thought }
	format.js
      else
        format.html { render action: "new" }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /thoughts/1
  # PUT /thoughts/1.json
  def update
    @thought = Thought.find(params[:id])

    respond_to do |format|
      if @thought.update_attributes(params[:thought])
        format.html { redirect_to @thought, notice: 'Thought was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thoughts/1
  # DELETE /thoughts/1.json
  def destroy
    @thought = Thought.find(params[:id])
    @quast = @thought.quastion
    @thought.destroy

    respond_to do |format|
      format.html { redirect_to quastion_path(@quast) }
      format.json { head :no_content }
    end
  end
end
