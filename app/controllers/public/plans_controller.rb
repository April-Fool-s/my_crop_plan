class Public::PlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  def new
    @plan = Plan.new
    @plan_crop = @plan.plan_crops.build
    @crops = Crop.all
    @fields = current_user.fields.all
  end

  def create
    @plan = current_user.plans.new(plans_params)
    if @plan.save
      redirect_to plan_path(@plan)
    else
      @crops = Crop.all
      @fields = current_user.fields.all
      render 'new'
    end
  end

  def index
    @fields = current_user.fields.all
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
    set_fields_and_sections
  end

  def update
    if @plan.update(plans_params)
      redirect_to plan_path(@plan)
    else
      set_fields_and_sections
      render 'edit'
    end
  end

  def destroy
    @plan.destroy
    redirect_to plans_path
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def set_fields_and_sections
    @fields = current_user.fields.all
    @field_sections = @plan.field.field_sections.all
  end

  def plans_params
    params.require(:plan).permit(:field_id, :field_section_id, :year, :is_active, plan_crops_attributes: [:id, :name, :planting_method, :start_date, :end_date, :note, :_destroy])
  end

end
