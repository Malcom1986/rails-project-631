# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/form_builder'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  class Error < StandardError; end
end
