class Message < ApplicationRecord
  has_one_attached :photo

  after_create_commit { broadcast_append_to "messages" }
end
