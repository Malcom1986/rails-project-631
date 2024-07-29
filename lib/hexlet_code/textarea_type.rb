# frozen_string_literal: true

module HexletCode
  class TextareaType
    @@default_opts = { cols: 20, rows: 40 }

    def initialize(prop, value, opts = {})
      @prop = prop
      @value = value
      @opts = @@default_opts.merge(opts)
    end
    attr_reader(:tag, :prop, :value, :opts)

    def to_html
      params = { name: prop }
      Tag.build('textarea', params.merge(opts)) { value }
    end
  end
end
