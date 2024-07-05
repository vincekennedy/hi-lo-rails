module API
  module V1
    class Courses < Grape::API
      include API::V1::Defaults
        resource :courses do
          desc "Return all courses"
          get "" do
            Course.all
          end      

          desc "Return a single course"
          params do
            requires :id, type: String, desc: "ID of the course"
          end
          get ":id" do
            Course.where(id: permitted_params[:id]).first!
          end
        end
    end
  end
end