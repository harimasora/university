class Course < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 45}
  validates :description, presence: true, length: {maximum: 45}
  validates :status, presence: true
end
