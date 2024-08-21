class Public::FieldSectionsController < ApplicationController

  def index
    @field_sections = FieldSection.where(field_id: params[:field_id])
    respond_to do |format|
      format.json { render json: @field_sections }
    end
  end

end
