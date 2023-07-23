# frozen_string_literal: true

require 'rails_helper'

feature 'Creating a new Episode', type: :turbo do
  let(:user) { create :user }
  let(:podcast) { create :podcast }
  let(:episode) { create 'episode' }
  let(:attributes) { attributes_for 'episode' }

  it 'creates new Episode' do
    visit root_path

    sign_in user

    click_link 'Episodes'
    count = Episode.count

    sleep 1
    click_on 'New Episode'

    fill_in 'Title', with: attributes[:title]
    fill_in 'Podcast', with: podcast.id

    click_button 'Save'

    expect(page).to have_content attributes[:email]
    expect(Episode.count).to eq(count + 1)

    new_episode = Episode.last

    episodes_expectations new_episode, attributes
  end
end
