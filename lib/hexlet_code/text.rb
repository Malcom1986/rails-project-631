# frozen_string_literal: true

module HexletCode
  class Text
    def initialize(field_name, value, opts)
      @tag = 'input'
      @type = 'text'
      @default_opts = {}
      @options = get_options(field_name, value, opts)
      @content = nil
    end
    attr_reader(:tag, :type, :options, :content)

    def get_options(name, value, custom_opts)
      required_opts = { name:, type:, value: }
      required_opts.merge(@default_opts, custom_opts)
    end
  end
end
