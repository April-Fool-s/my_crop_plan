module Api
  module V1
    class CropsController < ApplicationController
      before_action :authenticate_user!

      def index
        admin_user_ids = Admin.pluck(:id)
        @crops = Crop.where(user_id: admin_user_ids)

        render json: @crops.select(:id, :name, :plant_family, :rotation_year, :companion)
      end

      def show
        @crop = Crop.find(params[:id])
        render json: {
          id: @crop.id,
          name: @crop.name,
          plant_family: @crop.plant_family,
          rotation_year: @crop.rotation_year,
          companion: @crop.companion
        }
      end

    end
  end
end

