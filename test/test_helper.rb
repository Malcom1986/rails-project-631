# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

require 'minitest-power_assert'

def read_fixture(file_name)
  filename = "#{file_name}.html"
  fixture_path = File.join(__dir__, 'fixtures', filename)
  File.read(fixture_path).strip
end
