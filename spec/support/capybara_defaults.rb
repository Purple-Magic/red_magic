module CapybaraDefaults
  DEFAULT_WAIT = 5
end

RSpec.configure do |config|
  config.include CapybaraDefaults
end
