# frozen_string_literal: true

module HexletCode
  class Form
    def initialize(opts = {})
      @tag = 'form'
      @default_opts = { action: '#', method: 'post' }
      @children = []
      @options = get_options(opts)
    end

    attr_accessor :tag, :options, :children

    def get_options(custom_opts)
      action = custom_opts[:url]
      action = action ? { action: } : {}
      @default_opts.merge(custom_opts, action).except(:url)
    end
  end
end
