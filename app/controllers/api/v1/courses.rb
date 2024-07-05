module API
    module V1
      class Courses < Grape::API
        include API::V1::Defaults
          resource :courses do
            desc "Return all courses"
            get "" do
                Course.all
            end      
          end
       end
    end
end