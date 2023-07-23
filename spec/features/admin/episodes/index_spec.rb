# frozen_string_literal: true

require 'rails_helper'

feature 'Episode Index Page', type: :feature do
  let(:user) { create :user }
  let!(:episodes) { create_list 'episode', 5 }

  scenario 'displays a list of episodes' do
    sign_in user

    click_on 'Episodes'

    expect(page.status_code).to eq(200)
    expect(page).to have_current_path(episodes_path)

    episodes.each do |episode|
      expect(page).to have_content(episode.title)
    end
  end
end
