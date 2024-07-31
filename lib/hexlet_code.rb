# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :Formatters, 'hexlet_code/formatters'

  def self.form_for(entity, opts = {})
    builder = FormBuilder.new(entity, opts)
    yield builder
    form = builder.structure
    HexletCode::Formatters::HtmlFormatter.format form
  end

  class Error < StandardError; end
end
