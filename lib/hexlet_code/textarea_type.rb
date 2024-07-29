# frozen_string_literal: true

module HexletCode
  class TextareaType
    def initialize(prop, value, opts = {})
      @default_opts = { cols: 20, rows: 40 }
      @prop = prop
      @value = value
      @opts = opts
    end
    attr_reader(:prop, :value)

    def to_html
      options = @default_opts.merge(@opts)
      params = { name: prop }
      label = Tag.build('label', for: prop) { prop.capitalize }
      input = Tag.build('textarea', params.merge(options)) { value }
      "#{label}#{input}"
    end
  end
end
