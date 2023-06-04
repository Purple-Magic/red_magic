require 'rails_helper'

feature 'Update podcast', type: :feature do
  let(:user) { create :user }
  let!(:podcast) { create :podcast }
  let(:attributes) { attributes_for :podcast }

  context 'Updating from the list' do
    before do
      visit root_path

      sign_in user

      click_link 'Podcasts'

      first('tbody tr').click_on('Edit')

      fill_in 'Title', with: attributes[:title]

      find(:label, 'Upload logo').click

      attach_file('logo', 'public/apple-touch-icon.png')

      click_button 'Save'
    end

    scenario 'See the new podcast title' do
      expect(page).to have_content(attributes[:title])
    end

    scenario 'Update podcast' do
      podcast.reload

      expect(podcast.title).to eq(attributes[:title])
    end
  end
end

