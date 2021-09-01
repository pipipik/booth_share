class BoothsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @booths = Booth.all.order("id DESC")
  end

  def new
    @booth = Booth.new
  end

  def create
    @booth = Booth.new(booth_params)
    if @booth.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @booth = Booth.find(params[:id])
  end

  def edit
    @booth = Booth.find(params[:id])
  end
  
  def update
    @booth = Booth.find(params[:id])
    if @booth.update(booth_params)
      redirect_to booth_path(@booth)
    else
      render :edit
    end
  end
  
  private

  def booth_params
    params.require(:booth).permit(:image, :prize_name, :machine_name, :category).merge(user_id: current_user.id)
  end

end
