class CourseSerializer < ActiveModel::Serializer
    attributes :name, :rating, :slope, :par, :holes

    def holes
        object.holes.count
    end
end