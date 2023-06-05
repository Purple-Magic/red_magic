# frozen_string_literal: true

require 'rails_helper'
require 'pry'

feature 'Creating a new Podcast', type: :feature do
  let(:user) { create :user }
  let(:attributes) { attributes_for :podcast }
  let!(:count) { Podcast.count }

  before do
    visit root_path

    sign_in user

    click_link 'Podcasts'

    click_link 'New Podcast'

    fill_in 'Title', with: attributes[:title]

    attach_file('public/apple-touch-icon.png') do
      find(:label, 'Upload logo').click
    end

    click_button 'Save'
  end

  scenario 'User creates a new Podcast' do
    expect(Podcast.count).to eq(count + 1)
  end

  scenario 'User watches new Podcast title on the page' do
    expect(page).to have_content attributes[:title]
  end
end
