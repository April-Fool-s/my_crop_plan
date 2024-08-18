class Public::FieldsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_field, only: [:show, :edit, :update, :destroy]

  def new
    @field = Field.new
    @field_section = @field.field_sections.build
  end

  def create
    @field = current_user.fields.new(fields_params)
    @field.save
    redirect_to field_path(@field)
  end

  def index
    @fields = current_user.fields.all
  end

  def show
    @field_sections = @field.field_sections
  end

  def edit
  end

  def update
    @field.update(fields_params)
    redirect_to field_path(@field)
  end

  def destroy
    @field = Field.find(params[:id])
    @field.destroy
    redirect_to fields_path
  end

  private

  def set_field
    @field = Field.find(params[:id])
  end

  def fields_params
    params.require(:field).permit(:name, :address, :area, field_sections_attributes: [:id, :name, :_destroy])
  end
end
