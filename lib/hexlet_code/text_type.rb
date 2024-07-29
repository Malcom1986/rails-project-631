# frozen_string_literal: true

module HexletCode
  class TextType
    def initialize(prop, value, opts = {})
      @default_opts = {}
      @prop = prop
      @value = value
      @opts = opts
    end
    attr_reader(:prop, :value)

    def to_html
      options = @default_opts.merge(@opts)
      params = { name: prop, type: 'text', value: }
      label = Tag.build('label', for: prop) { prop.capitalize }
      input = Tag.build('input', params.merge(options))
      "#{label}#{input}"
    end
  end
end
