# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/text'
require_relative 'hexlet_code/textarea'
require_relative 'hexlet_code/form'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/submit'
require_relative 'hexlet_code/html_formatter'
require 'active_support/core_ext/string/inflections'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form'
  autoload :Text, 'hexlet_code/text'
  autoload :Textarea, 'hexlet_code/textarea'
  autoload :Label, 'hexlet_code/label'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :HtmlFormatter, 'hexlet_code/html_formatter'

  def self.form_for(entity, opts = {})
    builder = FormBuilder.new(entity, opts)
    yield builder
    HtmlFormatter.format builder.structure
  end

  class Error < StandardError; end
end
