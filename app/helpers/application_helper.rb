# frozen_string_literal: true

module ApplicationHelper
  include TailwindHelpers

  def navbar
    tramway_navbar brand: 'RED MAGIC' do |nav|
      nav.left do
        nav.item 'Podcasts', podcasts_path
      end

      nav.right do
        if current_user.present?
          nav.item 'Sign out', destroy_user_session_path, method: :delete, confirm: 'Wanna quit?'
        else
          nav.item 'Sign In', new_user_session_path
        end
      end
    end
  end
end
