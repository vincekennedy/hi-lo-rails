class Course < ApplicationRecord
    has_many :holes

    def show
        @course = Course.find(params[:id])
        @holes = @course.holes
    end
end