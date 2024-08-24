class Hole < ApplicationRecord
    belongs_to :course

    validates :handicap, presence: true, numericality: { only_integer: true }
    validate :unique_handicap_within_course

  private

  def unique_handicap_within_course
    if golf_course.holes.where.not(id: id).exists?(handicap: handicap)
      errors.add(:handicap, "must be unique within the same course")
    end
  end
end
