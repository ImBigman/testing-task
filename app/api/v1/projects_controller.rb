module Api
  module V1
    class ProjectsController < BaseController

      def index
        render json: { message: “ok” }
      end

    end
  end
end
