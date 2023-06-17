# frozen_string_literal: true

require 'rails_helper'

feature 'Podcast Show Page', type: :feature do
  let(:user) { create :user }
  let!(:podcast) { create 'podcast' }

  scenario 'displays a podcast page' do
    sign_in user

    click_on 'Podcasts'

    click_on podcast.title

    expect(page.status_code).to eq(200)
    expect(page).to have_current_path(podcast_path(podcast))

    expect(page).to have_content(podcast.title)
  end
end
