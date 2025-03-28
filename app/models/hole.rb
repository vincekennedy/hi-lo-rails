class Hole < ApplicationRecord
    belongs_to :course
    validates :hole_number, presence: true, numericality: { only_integer: true }
    validates :hole_par, presence: true, numericality: { only_integer: true }
    validates :hole_handicap, presence: true, numericality: { only_integer: true },
                uniqueness: { scope: :course_id, message: 'must be unique for the same course' }

end
