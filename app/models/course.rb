class Course < ActiveRecord::Base
  extend EnumerateIt

  has_many :classrooms
  has_many :students, :through => :classrooms

  has_enumeration_for :status, with: ActiveStatus

  validates :name, presence: true, length: {maximum: 45}
  validates :description, presence: true, length: {maximum: 45}
  validates :status, presence: true

  before_validation {self.status = self.status.to_i}
end
