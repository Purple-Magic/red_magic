class Podcast < ApplicationRecord
  after_create_commit { broadcast_append_to "podcasts" }
end
