# frozen_string_literal: true

module HexletCode
  class TextType
    @@default_opts = {}

    def initialize(prop, value, opts = {})
      @prop = prop
      @value = value
      @opts = @@default_opts.merge(opts)
    end
    attr_reader(:tag, :prop, :value, :opts)

    def to_html
      params = { name: prop, type: 'text', value: }
      label = Tag.build('label', for: prop) { prop.capitalize }
      input = Tag.build('input', params.merge(opts))
      "#{label}#{input}"
    end
  end
end
