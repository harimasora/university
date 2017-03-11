class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates :student_id, presence: true
  validates :course_id, presence: true

  before_create {self.entry_at = DateTime.now }
end
