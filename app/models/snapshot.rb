class Snapshot < ApplicationRecord
  after_create_commit { broadcast_append_to "snapshots" }
end
