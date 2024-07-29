# frozen_string_literal: true

module HexletCode
  class Form
    def initialize(entity, opts = {})
      @fields = []
      @entity = entity
      @opts = opts
    end

    def to_html
      action = @opts[:url] || '#'
      content = @fields.map(& :to_html).join
      Tag.build('form', action:, method: 'post') { content }
    end

    def input(field, opts = {})
      value = @entity.public_send(field)
      type = opts[:as]
      @fields << if type.nil?
                   TextType.new(field, value, opts.except(:as))
                 elsif type == :text
                   TextareaType.new(field, value, opts.except(:as))
                 end
    end

    def submit(value = 'Save')
      @fields << Submit.new(value)
    end
  end
end
