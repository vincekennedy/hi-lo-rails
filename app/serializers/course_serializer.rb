class CourseSerializer < ActiveModel::Serializer
    attributes :id, :name, :rating, :slope, :par
    has_many :holes, serializer: HoleSerializer
end