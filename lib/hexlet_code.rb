# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/text_type'
require_relative 'hexlet_code/textarea_type'
require_relative 'hexlet_code/form'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/submit'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form'
  class Error < StandardError; end

  def self.form_for(entity, opts = {})
    form = Form.new(entity, opts)
    yield form
    form.to_html
  end
end
