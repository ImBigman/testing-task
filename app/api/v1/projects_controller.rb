module Api
  module V1
    class ProjectsController < ApplicationController

      def index
        render json: { message: “ok” }
      end

    end
  end
end
