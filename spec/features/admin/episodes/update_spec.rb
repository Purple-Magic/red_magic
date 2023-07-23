# frozen_string_literal: true

require 'rails_helper'

feature 'Episode Update Page', type: :feature do
  let(:user) { create :user }
  let!(:episode) { create 'episode' }

  context 'check edit page' do
    before do
      sign_in user

      click_on 'Episodes'

      click_on episode.title
      click_on 'Edit'
    end

    scenario 'opens page' do
      expect(page.status_code).to eq(200)
      expect(page).to have_current_path(edit_episode_path(episode))
    end

    scenario 'check all inputs' do
      expect(find_field('episode[title]').value).to eq(episode.title)
    end

    scenario 'returns back' do
      click_on 'Back'

      expect(page).to have_current_path(episode_path(episode))
    end
  end

  context 'check updates all attributes' do
    let(:attributes) { attributes_for 'episode' }

    before do
      sign_in user

      click_on 'Episodes'

      click_on episode.title
      click_on 'Edit'

      fill_in 'Title', with: attributes[:title]

      click_on 'Save'
    end

    scenario 'updates a episode' do
      episode.reload

      episodes_expectations episode, attributes
    end

    scenario 'renders show page' do
      expect(page.status_code).to eq(200)

      expect(page).to have_current_path(episode_path(episode))
      expect(page).to have_content(attributes[:title])
    end
  end

  context 'check updates single attribute' do
    let(:attributes) { attributes_for 'episode' }

    scenario 'just title' do
      sign_in user

      click_on 'Episodes'

      click_on episode.title
      click_on 'Edit'

      fill_in 'Title', with: attributes[:title]

      click_on 'Save'
      episode.reload

      episodes_expectations episode, attributes
    end
  end
end
