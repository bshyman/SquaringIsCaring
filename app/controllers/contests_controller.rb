class ContestsController < ApplicationController
  # before_filter :authenticate_user!, :except => [:show...]

  def index
  	@contests = Contest.all
  end

  def new
  	@contest = Contest.new
  end

  def show
    @contest = Contest.find(params[:id])
  end

  def create
  	@contest = Contest.new(contest_params)
  	if @contest.save
      render '_board'
  		flash[:notice] = "Your Board has been created"
  	else
  		render 'new'
  		@errors = @contest.errors.full_messages	
  	end
  end

  def edit
  	@contest = Contest.find(params[:id])
  end


  def update
  	@contest = Contest.find(params[:id])
  	@contest.update_attributes(contest_params)
  	if @contest.save
  		flash[:notice] = "Your changes have been saved"
  		render 'show'
  	else
  		@errors = @contest.errors.full_messages	
  		render 'edit'
  	end
  end

  	
  def destroy
  	@contest = Contest.find(params[:id])
  	@contest.destroy
  	flash[:notice] = "Your Board has been deleted"
  	render 'index'
  end


private
	def contest_params
		params.require(:contest).permit(:event_name, :event_date, :cell_value, :sport, :reserve, :prizes)
	end

end