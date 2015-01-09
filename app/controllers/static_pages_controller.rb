class StaticPagesController < ApplicationController
  def index
    @search = params[:search]
    # @results = params[:search]
    if @search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
      redirect_to static_pages_results_path
    else 
      find[:all]
    end
  end

  def results
     search = params[:search]
  end



end
