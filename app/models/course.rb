class Course < ApplicationRecord
    has_many :holes, dependent: :destroy
    validates :name, presence: true
    validates :rating, presence: true
    validates :slope, presence: true
    validates :par, presence: true
    accepts_nested_attributes_for :holes
    validates :holes, :length => { :minimum => 9}
    validate :must_have_unique_handicaps


    private
    def must_have_unique_handicaps
        if holes.map(&:hole_handicap).uniq.length != holes.size
            errors.add(:holes, 'must have unique handicaps')
        end
    end
end