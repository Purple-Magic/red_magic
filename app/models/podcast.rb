# frozen_string_literal: true

class Podcast < ApplicationRecord
  has_one_attached :logo

  after_create_commit { broadcast_append_to 'podcasts' }
end
