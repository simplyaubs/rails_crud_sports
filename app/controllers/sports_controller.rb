class SportsController < ApplicationController

  def index
    @sport = Sport.new
    @sports = Sport.all
  end

  def create
    @sport = Sport.new(sport_params)
    if @sport.save

      redirect_to sports_path
    else
      render :index
    end
  end

  private
  def sport_params
    params.require(:sport).permit(:name, :equip)
  end
  
end