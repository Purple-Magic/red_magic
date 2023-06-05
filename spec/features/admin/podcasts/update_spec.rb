require 'rails_helper'

feature 'Update podcast', type: :turbo do
  let(:user) { create :user }
  let!(:podcast) { create :podcast }
  let(:attributes) { attributes_for :podcast }

  context 'Updating from the list' do
    before do
      visit root_path

      sign_in user

      click_link 'Podcasts'

      find('tbody tr', wait: CapybaraDefaults::DEFAULT_WAIT).click_on('Edit')

      fill_in 'Title', with: attributes[:title]

      attach_file('public/apple-touch-icon.png') do
        find(:label, 'Upload logo').click
      end

      click_button 'Save'
    end

    scenario 'Update podcast' do
      expect(page).to have_content(attributes[:title])

      podcast.reload

      expect(podcast.title).to eq(attributes[:title])
    end
  end
end

