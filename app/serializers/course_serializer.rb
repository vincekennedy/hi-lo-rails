class CourseSerializer < ActiveModel::Serializer
    attributes :id, :name, :rating, :slope, :par, :holes
end