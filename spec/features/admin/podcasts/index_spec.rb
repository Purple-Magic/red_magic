# frozen_string_literal: true

require 'rails_helper'

feature 'Podcast Index Page', type: :feature do
  let(:user) { create :user }
  let!(:podcasts) { create_list 'podcast', 5 }

  scenario 'displays a list of podcasts' do
    sign_in user

    click_on 'Podcasts'

    expect(page.status_code).to eq(200)
    expect(page).to have_current_path(podcasts_path)

    podcasts.each do |podcast|
      expect(page).to have_content(podcast.title)
    end
  end
end
