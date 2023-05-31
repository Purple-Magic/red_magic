# frozen_string_literal: true

require 'rails_helper'

feature 'Sign in' do
  let(:user) { create :user }

  scenario 'User can sign in with valid credentials' do
    sign_in user

    expect(current_path).to eq(root_path)
    expect(page).to have_selector("input[type=submit][value='Sign out']")
  end

  scenario 'User cannot sign in with invalid credentials' do
    sign_in email: 'invalid@email.com', password: 'invalidpassword'

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_selector("input[type=submit][value='Sign In']")
  end
end
