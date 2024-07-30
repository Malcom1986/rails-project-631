# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form'
  autoload :Text, 'hexlet_code/text'
  autoload :Textarea, 'hexlet_code/textarea'
  autoload :Label, 'hexlet_code/label'
  autoload :Submit, 'hexlet_code/submit'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :HtmlFormatter, 'hexlet_code/html_formatter'

  def self.form_for(entity, opts = {})
    builder = FormBuilder.new(entity, opts)
    yield builder
    form = builder.structure
    HtmlFormatter.format form
  end

  class Error < StandardError; end
end
