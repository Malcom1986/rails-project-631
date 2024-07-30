# frozen_string_literal: true

module HexletCode
  class Textarea
    def initialize(field_name, value, opts)
      @tag = 'textarea'
      @default_opts = { cols: 20, rows: 40 }
      @options = get_options(field_name, opts)
      @content = value
    end
    attr_reader(:tag, :options, :content)

    def get_options(name, custom_opts)
      required_opts = { name: }
      required_opts.merge(@default_opts, custom_opts)
    end
  end
end
