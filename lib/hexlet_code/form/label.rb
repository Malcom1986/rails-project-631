# frozen_string_literal: true

module HexletCode
  module Form
    class Label
      def initialize(field_name)
        @tag = 'label'
        @default_opts = {}
        @options = get_options(field_name)
        @content = field_name.capitalize
      end
      attr_reader(:tag, :options, :content)

      def get_options(field_name)
        required_opts = { for: field_name }
        required_opts.merge(@default_opts)
      end
    end
  end
end
