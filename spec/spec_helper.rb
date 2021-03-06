# frozen_string_literal: true
require "pry"
require "webmock/rspec"
require "factory_girl_rails"

$LOAD_PATH.unshift("app/errors")
$LOAD_PATH.unshift("app/services")
$LOAD_PATH.unshift("spec/support")

RSpec.configure do |config|
  WebMock.disable_net_connect!(allow_localhost: true)

  config.include FactoryGirl::Syntax::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
    mocks.syntax = :expect
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.example_status_persistence_file_path = "spec/examples.txt"

  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  config.order = :random

  Kernel.srand config.seed
end
