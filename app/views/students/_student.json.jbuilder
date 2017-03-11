json.extract! student, :id, :name, :register_number, :status, :created_at, :updated_at
json.url student_url(student, format: :json)
