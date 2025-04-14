require "test_helper"

class CourseTest < ActiveSupport::TestCase
  def setup
    @valid_attributes = {
      name: "Test Course",
      rating: 72.5,
      slope: 123,
      par: 72,
      holes_attributes: Array.new(9) do |i|
        { hole_number: i + 1, hole_par: 4, hole_handicap: i + 1 }
      end
    }
  end

  test "course is valid with valid attributes" do
    course = Course.new(@valid_attributes)
    assert course.valid?
  end

  test "course is invalid without a name" do
    course = Course.new(@valid_attributes.except(:name))
    assert_not course.valid?
    assert_includes course.errors[:name], "can't be blank"
  end

  test "course is invalid without a rating" do
    course = Course.new(@valid_attributes.except(:rating))
    assert_not course.valid?
    assert_includes course.errors[:rating], "can't be blank"
  end

  test "course is invalid without a slope" do
    course = Course.new(@valid_attributes.except(:slope))
    assert_not course.valid?
    assert_includes course.errors[:slope], "can't be blank"
  end

  test "course is invalid without a par" do
    course = Course.new(@valid_attributes.except(:par))
    assert_not course.valid?
    assert_includes course.errors[:par], "can't be blank"
  end

  test "course allows creating holes via nested attributes" do
    course = Course.new(@valid_attributes)
    assert_equal 9, course.holes.size
    assert course.valid?
  end

  test "course is invalid with fewer than 9 holes" do
    attributes_with_few_holes = @valid_attributes.merge(
      holes_attributes: Array.new(8) do |i|
        { hole_number: i + 1, hole_par: 4, hole_handicap: i + 1 }
      end
    )
    course = Course.new(attributes_with_few_holes)
    assert_not course.valid?
    assert_includes course.errors[:holes], "is too short (minimum is 9 characters)"
  end

  test "course is invalid if hole handicaps are not unique" do
    attributes_with_duplicate_handicaps = @valid_attributes.merge(
      holes_attributes: Array.new(9) do |i|
        { hole_number: i + 1, hole_par: 4, hole_handicap: 1 }
      end
    )
    course = Course.new(attributes_with_duplicate_handicaps)
    assert_not course.valid?
    assert_includes course.errors[:holes], "must have unique handicaps"
  end
end
