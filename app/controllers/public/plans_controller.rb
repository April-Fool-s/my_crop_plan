class Public::PlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  def new
    @plan = Plan.new
    @fields = current_user.fields.all
    @field_sections = FieldSection.all
    @crops = Crop.all
  end

  def create
    @plan = current_user.plans.new(plans_params)
    @plan.save
    redirect_to plan_path(@plan)
  end

  def index
  end

  def show
    @field = @plan.field
    @field_section = @plan.field_section
    @crop = @plan.crop
  end

  def edit
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plans_params
    params.require(:plan).permit(:year, :title, :planting_method, :start_date, :end_date, :note, :field_id, :field_section_id, :crop_id)
  end

end
