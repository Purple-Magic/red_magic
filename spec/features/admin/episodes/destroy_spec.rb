# frozen_string_literal: true

require 'rails_helper'

feature 'Destroy episode', type: :feature do
  let(:user) { create :user }
  let(:episode) { create 'episode' }
  let!(:another_episode) { create 'episode' }

  scenario 'displays a episode page' do
    sign_in user

    count = Episode.count

    click_on 'Episodes'

    click_on another_episode.title

    click_on 'Destroy'

    expect(page.status_code).to eq(200)
    expect(count).to eq(Episode.count + 1)
    expect(page).to have_current_path(episodes_path)
  end
end
