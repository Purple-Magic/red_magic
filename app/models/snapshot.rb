# frozen_string_literal: true

class Snapshot < ApplicationRecord
  after_create_commit { broadcast_append_to 'snapshots' }
end
