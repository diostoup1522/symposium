json.extract! discussion, :id, :book, :author, :description, :creator_id, :created_at, :updated_at
json.url discussion_url(discussion, format: :json)
