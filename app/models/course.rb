class Course < ApplicationRecord
    has_many :holes
    validates :name, presence: true
    validates :rating, presence: true
    validates :slope, presence: true
    validates :par, presence: true

    validates :holes, :length => { :minimum => 9}

    accepts_nested_attributes_for :holes

    def show
        @course = Course.find(params[:id])
        @holes = @course.holes
    end

    def create
        logger.info "!------- CREATE METHOD ------!"
    end

    private

        def course_params
            params.require(:name, :rating, :slope, :par, :holes)
        end
end