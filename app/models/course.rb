class Course < ActiveRecord::Base
  has_many :classrooms
  has_many :students, :through => :classrooms

  validates :name, presence: true, length: {maximum: 45}
  validates :description, presence: true, length: {maximum: 45}
  validates :status, presence: true
end
