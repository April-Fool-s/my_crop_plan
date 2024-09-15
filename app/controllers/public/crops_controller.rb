class Public::CropsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_crop, only: [:show, :edit, :update, :destroy]

  def new
    @crop = Crop.new
  end

  def create
    @crop = current_user.crops.new(crops_params)
    if @crop.save
      redirect_to crop_path(@crop), notice: "作物マスターを登録しました。"
    else
      flash.now[:alert] = "作物マスターを登録できませんでした。"
      render 'new'
    end
  end

  def index
    admin_user_ids = Admin.pluck(:id)
    @crops = Crop.where(user_id: admin_user_ids + [current_user.id])

    # 検索機能
    if params[:search].present?
      @crops = @crops.where('name LIKE ? OR plant_family LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
    end

    # 並べ替え機能
    case params[:sort]
      when 'newest'
        @crops = @crops.order(created_at: :desc)  # 新しい順
      when 'oldest'
        @crops = @crops.order(created_at: :asc)   # 古い順
      else
        @crops = @crops.order(created_at: :desc)  # デフォルトは新しい順
    end
  end

  def show
  end

  def edit
  end

  def update
    if @crop.update(crops_params)
      redirect_to crop_path(@crop), notice: "作物マスターを編集しました。"
    else
      flash.now[:alert] = "作物マスターを編集できませんでした。"
      render 'edit'
    end
  end

  def destroy
    if @crop.destroy
      redirect_to crops_path, notice: "作物マスターを削除しました。"
    else
      flash.now[:alert] = "作物マスターをを削除できませんでした。"
      render 'show'
    end
  end

  def crop_list
    @crops = Crop.all
    respond_to do |format|
      format.json { render json: @crops }
    end
  end

  private

  def set_crop
    @crop = Crop.find(params[:id])
  end

  def crops_params
    params.require(:crop).permit(:user_id, :plant_family, :name, :rotation_year, :companion, :note)
  end

end
