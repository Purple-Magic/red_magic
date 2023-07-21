# frozen_string_literal: true

module ApplicationHelper
  include TailwindHelpers

  def navbar
    tramway_navbar title: 'RED MAGIC', background: { color: :red, intensity: 500 } do |nav|
      nav.left do
        nav.item 'Users', '/users'
        nav.item 'Podcasts', '/podcasts'
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
