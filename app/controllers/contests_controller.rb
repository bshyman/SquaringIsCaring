class ContestsController < ApplicationController
  # before_filter :authenticate_user!, :except => [:show...]

  respond_to :html, :xml, :json

   include Archivable::Controller


  def index

    if params[:search]
      @contests = Contest.search(params[:search]).order("created_at DESC")
    else
  	 @contests = Contest.where(archived:false)
    end
  end

  def search 
    
  end

  def new
  	@contest = Contest.new
  end

  def show
    redirect_to new_user_session_path unless logged_in? 
    @contest = Contest.find(params[:id])
    # begin
    if closed?(@contest)
      @nums = []
        if request.xhr?
          # p "AJAX"
          @contest.available_nums.each{|num| @nums << num.to_i}
          render :json => @nums
        else
          # flash[:notice] = "NO AJAX"
          # p "NO AJAX"
          # redirect_to login_path
        end
    end
    # rescue 
      # flash[:notice] = "ERROR SUCKAA"
    # render '_board'
    # end
  end

  def create
    @contest = Contest.new(contest_params)
    p contest_params
  	if @contest.save
      flash[:notice] = "Your Board has been created"
      redirect_to contest_path(@contest)
    else
      flash[:error] = "Errrror"
      @errors = @contest.errors.full_messages	
    end
  end

  def edit
  	@contest = Contest.find(params[:id])

  end


  def update
  	@contest = Contest.find(params[:id])
   
    @contest.save
    if @contest.persisted?
    @contest.update_attributes(contest_params)
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
  	redirect_to archived_contests_path
  end

  def box_score
    @contest = Contest.find(params[:id])
    render '_box_score'

  end

  def display_owners
    @contest = Contest.find(params[:id])
    # @cells = [] 
    # @contest.cells.each do |cell|
    #   @cells << cell
    # end

    if closed?(@contest)
      render json: @contest.cells

    end

  end

  def archive
    @contest = Contest.find(params[:id])
    @contest.archive!
    flash[:notice] = "Archived!!!"
    redirect_to contests_path

  end

  def archived
    @contests = Contest.where(archived:true)
    @archive_msg = "Archived Contests"
    render 'index'
  end




  private
  def contest_params
    params.require(:contest).permit(:event_name, :event_date, :cell_value, :sport, :reserve, :prizes, :home_team, :away_team, :archived, :box_score => [:home => [:first, :half, :third, :final], :away => [:first, :half, :third, :final]])
  end

end