class Public::CropsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_crop, only: [:show, :edit, :update, :destroy]

  def new
    @crop = Crop.new
  end

  def create
    @crop = current_user.crops.new(crops_params)
    @crop.save
    redirect_to crop_path(@crop)
  end

  def index
  end

  def show
  end

  def edit
  end

  def destroy
    @crop.destroy
    redirect_to crops_path
  end

  private

  def set_crop
    @crop = Crop.find(params[:id])
  end

  def crops_params
    params.require(:crop).permit(:user_id, :plant_family, :name, :rotation_year, :companion, :note)
  end

end
