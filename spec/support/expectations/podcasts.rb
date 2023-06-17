# frozen_string_literal: true

module Expectations
  module Podcasts
    def podcasts_expectations(object, attributes)
      exceptions = []
      attributes.except(*exceptions).each do |(key, value)|
        real = object.public_send(key)
        expected = attributes[key].to_s

        expect(real).to eq(expected), "Attribute #{key} is not equal to #{value}"
      end
    end
  end
end

RSpec.configure do |config|
  config.include Expectations::Podcasts
end
