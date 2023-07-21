# frozen_string_literal: true

class PodcastDecorator < Tramway::BaseDecorator
  delegate_attributes :logo, :title

  def dates
    table = %i[created_at updated_at].map do |date|
      { name: date, date: object.public_send(date) }
    end

    render(TableComponent.new(table))
  end
end
