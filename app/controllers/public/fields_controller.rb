class Public::FieldsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_field, only: [:show, :edit, :update, :destroy]

  def new
    @field = Field.new
    @field_section = @field.field_sections.build
  end

  def create
    @field = current_user.fields.new(fields_params)
    if @field.save
      redirect_to request.referer, notice: "畑を登録しました。"
    else
      flash.now[:alert] = "畑を登録できませんでした。"
      render 'new'
    end
  end

  def index
    @field = Field.new
    @field_section = @field.field_sections.build
    @fields = current_user.fields.all

        # 住所の部分一致検索
    if params[:address].present?
      @fields = @fields.where("address LIKE ?", "%#{params[:address]}%")
    end

    # 並べ替え機能
    if params[:sort].present?
      case params[:sort]
      when 'created_at_asc'
        @fields = @fields.order(created_at: :asc)
      when 'created_at_desc'
        @fields = @fields.order(created_at: :desc)
      when 'updated_at_asc'
        @fields = @fields.order(updated_at: :asc)
      when 'updated_at_desc'
        @fields = @fields.order(updated_at: :desc)
      end
    end
  end

  def show
    @field_sections = @field.field_sections
  end

  def edit
  end

  def update
    if @field.update(fields_params)
      redirect_to field_path(@field), notice: "畑を編集しました。"
    else
      flash.now[:alert] = "畑を編集できませんでした。"
      render 'edit'
    end
  end

  def destroy
    if @field.destroy
      redirect_to fields_path, notice: "畑を削除しました。"
    else
      @field_sections = @field.field_sections
      flash.now[:alert] = "畑を削除できませんでした。"
      render 'show'
    end
  end

  def field_section_list
    @field_sections = FieldSection.where(field_id: params[:field_id])
    respond_to do |format|
      format.json { render json: @field_sections }
    end
  end

  private

  def set_field
    @field = Field.find(params[:id])
  end

  def fields_params
    params.require(:field).permit(:name, :address, :area, field_sections_attributes: [:id, :name, :_destroy])
  end

end
