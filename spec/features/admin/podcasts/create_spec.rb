# frozen_string_literal: true

require 'rails_helper'

feature 'Creating a new Podcast', type: :turbo do
  let(:user) { create :user }
  let(:podcast) { create 'podcast' }
  let(:attributes) { attributes_for 'podcast' }

  it 'creates new Podcast' do
    visit root_path

    sign_in user

    click_link 'Podcasts'
    count = Podcast.count

    click_link 'New Podcast'

    fill_in 'Title', with: attributes[:title]

    click_button 'Save'

    expect(page).to have_content attributes[:email]
    expect(Podcast.count).to eq(count + 1)

    new_podcast = Podcast.last

    podcasts_expectations new_podcast, attributes
  end
end
