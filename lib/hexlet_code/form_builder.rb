# frozen_string_literal: true

require_relative 'form/line'
module HexletCode
  class FormBuilder
    attr_reader :structure

    def initialize(entity, opts = {})
      @entity = entity
      @structure = HexletCode::Form::Form.new(opts)
    end

    def input(field_name, opts = {})
      value = @entity.public_send(field_name)
      options = opts.except(:as)
      input_type = opts.fetch(:as, :line)
      input = get_input_class_name(input_type).constantize
      label = get_input_class_name('label').constantize
      structure.children << label.new(field_name)
      structure.children << input.new(field_name, value, options)
    end

    def submit(value = nil)
      submit = get_input_class_name('submit').constantize
      structure.children << submit.new(value)
    end

    def get_input_class_name(type)
      "HexletCode::Form::#{type.capitalize}"
    end
  end
end
