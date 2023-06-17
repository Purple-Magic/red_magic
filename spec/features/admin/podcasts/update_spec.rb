# frozen_string_literal: true

require 'rails_helper'

feature 'Podcast Update Page', type: :feature do
  let(:user) { create :user }
  let!(:podcast) { create 'podcast' }

  context 'check edit page' do
    before do
      sign_in user

      click_on 'Podcasts'

      click_on podcast.title
      click_on 'Edit'
    end

    scenario 'opens page' do
      expect(page.status_code).to eq(200)
      expect(page).to have_current_path(edit_podcast_path(podcast))
    end

    scenario 'check all inputs' do
      expect(find_field('podcast[title]').value).to eq(podcast.title)
    end

    scenario 'returns back' do
      click_on 'Back'

      expect(page).to have_current_path(podcast_path(podcast))
    end
  end

  context 'check updates all attributes' do
    let(:attributes) { attributes_for 'podcast' }

    before do
      sign_in user

      click_on 'Podcasts'

      click_on podcast.title
      click_on 'Edit'

      fill_in 'Title', with: attributes[:title]

      click_on 'Save'
    end

    scenario 'updates a podcast' do
      podcast.reload

      podcasts_expectations podcast, attributes
    end

    scenario 'renders show page' do
      expect(page.status_code).to eq(200)

      expect(page).to have_current_path(podcast_path(podcast))
      expect(page).to have_content(attributes[:title])
    end
  end

  context 'check updates single attribute' do
    let(:attributes) { attributes_for 'podcast' }

    scenario 'just title' do
      sign_in user

      click_on 'Podcasts'

      click_on podcast.title
      click_on 'Edit'

      fill_in 'Title', with: attributes[:title]

      click_on 'Save'
      podcast.reload

      podcasts_expectations podcast, attributes
    end
  end
end
