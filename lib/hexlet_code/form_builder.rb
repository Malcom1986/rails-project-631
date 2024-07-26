# frozen_string_literal: true

module HexletCode
  def self.form_for(entity, opts = {})
    builder = FormBuilder.new entity
    yield builder
    fields = builder.fields.join
    path = opts[:url] || '#'
    Tag.build('form', action: path, method: 'post') { fields }
  end

  class FormBuilder
    attr_accessor :fields

    def initialize(entity)
      @entity = entity
      @fields = []
    end

    def input(field, opts = {})
      value = @entity.public_send(field)
      @fields << if opts[:as] == :text
                   Tag.build('textarea', name: field, cols: 20, rows: 40) { value }
                 else
                   Tag.build('input', name: field, type: 'text', value:)
                 end
    end
  end
end
