module Api
  module V1
    class CropsController < ApplicationController
      before_action :authenticate_user!

      def index
        admin_user_ids = Admin.pluck(:id)
        @crops = Crop.where(user_id: admin_user_ids + [current_user.id])

        render json: @crops.select(:id, :name, :plant_family, :rotation_year, :companion)
      end

      def show
        @crop = Crop.find(params[:id])
        render json: @crop.select(:id, :name, :plant_family, :rotation_year, :companion)
      end
    end
  end
end

