json.extract! course, :id, :tittle, :description, :content, :duration, :price, :school_id, :created_at, :updated_at
json.url course_url(course, format: :json)
