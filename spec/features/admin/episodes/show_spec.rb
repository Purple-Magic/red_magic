# frozen_string_literal: true

require 'rails_helper'

feature 'Episode Show Page', type: :feature do
  let(:user) { create :user }
  let!(:episode) { create 'episode' }

  scenario 'displays a episode page' do
    sign_in user

    click_on 'Episodes'

    click_on episode.title

    expect(page.status_code).to eq(200)
    expect(page).to have_current_path(episode_path(episode))

    expect(page).to have_content(episode.title)
  end
end
