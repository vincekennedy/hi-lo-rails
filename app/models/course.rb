class Course < ApplicationRecord
    has_many :holes
    validates :name, presence: true
    validates :rating, presence: true
    validates :slope, presence: true
    validates :par, presence: true

    validates :holes, :length => { :minimum => 9}

    def show
        @course = Course.find(params[:id])
        @holes = @course.holes
    end
end