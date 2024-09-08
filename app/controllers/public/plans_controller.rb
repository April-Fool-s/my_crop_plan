class Public::PlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  def new
    @plan = Plan.new
    @plan_crop = @plan.plan_crops.build
    @crops = Crop.all
    set_fields
  end

  def create
    @plan = current_user.plans.new(plans_params)
    if @plan.save
      redirect_to plan_path(@plan), notice: "作付計画を登録しました。"
    else
      @crops = Crop.all
      set_fields
      flash.now[:alert] = "作付計画を登録できませんでした。"
      render 'new'
    end
  end

  def plan_table
    @current_year = params[:year] || Date.today.year
    @plans = current_user.plans.where(year: @current_year)
  end

  def index
    set_fields
    @plans = current_user.plans.all
    #検索機能の記述
    @plans = @plans.where(year: params[:year]) if params[:year].present?
    @plans = @plans.where(field_id: params[:field_id]) if params[:field_id].present?
    @plans = @plans.where(is_active: ActiveModel::Type::Boolean.new.cast(params[:status])) if params[:status].present?
  end

  def show
    @field = @plan.field
    @field_section = @plan.field_section
    @plan_crops = @plan.plan_crops
  end

  def edit
    @crops = Crop.all
    set_fields
    set_field_sections
  end

  def update
    if @plan.update(plans_params)
      redirect_to plan_path(@plan), notice: "作付計画を編集しました。"
    else
      set_fields
      set_field_sections
      flash.now[:alert] = "作付計画を編集できませんでした。"
      render 'edit'
    end
  end

  def destroy
    if @plan.destroy
      redirect_to plans_path, notice: "作付計画を削除しました。"
    else
      @field = @plan.field
      @field_section = @plan.field_section
      @plan_crops = @plan.plan_crops
      flash.now[:alert] = "作付計画を削除できませんでした。"
      render 'show'
    end
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def set_fields
    @fields = current_user.fields.all
  end

  def set_field_sections
    @field_sections = @plan.field.field_sections.all
  end

  def plans_params
    params.require(:plan).permit(:field_id, :field_section_id, :year, :is_active, plan_crops_attributes: [:id, :crop_id, :planting_method, :start_date, :end_date, :note, :_destroy])
  end

end
