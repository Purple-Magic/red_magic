# frozen_string_literal: true

require 'rails_helper'

feature 'Destroy podcast', type: :feature do
  let(:user) { create :user }
  let(:podcast) { create 'podcast' }
  let!(:another_podcast) { create 'podcast' }

  scenario 'displays a podcast page' do
    sign_in user

    count = Podcast.count

    click_on 'Podcasts'

    click_on another_podcast.title

    click_on 'Destroy'

    expect(page.status_code).to eq(200)
    expect(count).to eq(Podcast.count + 1)
    expect(page).to have_current_path(podcasts_path)
  end
end
