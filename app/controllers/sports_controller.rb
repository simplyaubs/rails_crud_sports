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

  def show
    @sport = Sport.find(params[:id])
  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def update
    @sport = Sport.find(params[:id])
    @sport.update_attributes!(sport_params)

    redirect_to sports_path
  end

  private
  def sport_params
    params.require(:sport).permit(:name, :equip)
  end
  
end