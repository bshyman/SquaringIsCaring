class ContestsController < ApplicationController
  # before_filter :authenticate_user!, :except => [:show...]

  def index
  	@contests = Contest.all
  end


end