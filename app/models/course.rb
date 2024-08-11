class Course < ApplicationRecord
    has_many :holes, dependent: :destroy
    validates :name, presence: true
    validates :rating, presence: true
    validates :slope, presence: true
    validates :par, presence: true

    validates :holes, :length => { :minimum => 9}

    accepts_nested_attributes_for :holes, allow_destroy: true
end