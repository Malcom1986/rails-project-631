# frozen_string_literal: true

require_relative 'text'
module HexletCode
  class FormBuilder
    TYPES = {
      text: 'HexletCode::Textarea',
      submit: 'HexletCode::Submit',
      label: 'HexletCode::Label',
      default: 'HexletCode::Text'
    }.freeze

    attr_reader :structure

    def initialize(entity, opts = {})
      @entity = entity
      @structure = Form.new(opts)
    end

    def input(field_name, opts = {})
      value = @entity.public_send(field_name)
      options = opts.except(:as)
      input_type = opts.fetch(:as, :default)
      type = TYPES.fetch(input_type).constantize
      label = TYPES.fetch(:label).constantize
      structure.children << label.new(field_name)
      structure.children << type.new(field_name, value, options)
    end

    def submit(value = nil)
      submit = TYPES.fetch(:submit).constantize
      structure.children << submit.new(value)
    end
  end
end
