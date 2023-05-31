# frozen_string_literal: true

# See https://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.filter_run_when_matching :focus
  config.run_all_when_everything_filtered = true
  config.example_status_persistence_file_path = 'tmp/rspec_examples.txt'

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.define_derived_metadata(file_path: %r{/spec/}) do |metadata|
    next if metadata.key?(:type)

    match = metadata[:location].match(%r{/spec/([^/]+)/})
    next unless match

    singularly_named_directories_directories = ['lib']

    metadata[:type] = match[1].then do |path|
      singularly_named_directories_directories.include?(path) ? path : path.singularize
    end.to_sym
  end

  # Always include the spec itself to the backtrace.
  # That also helps to avoid a full stack printing when
  # everything have been filtered out.
  config.backtrace_inclusion_patterns << %r{/spec/}

  config.order = :random
  Kernel.srand config.seed
end
