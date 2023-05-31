# frozen_string_literal: true

module Admin
  module SignInHelper
    def sign_in(user = nil, email: nil, password: nil)
      visit new_user_session_path

      fill_in 'Email', with: (user&.email || email)
      fill_in 'Password', with: (user&.password || password)
      click_button 'Sign In'
    end
  end
end

RSpec.configure do |config|
  config.include Admin::SignInHelper
end
