# frozen_string_literal: true

module HexletCode
  module Formatters
    class HtmlFormatter
      def self.format(form)
        fields = form.children.map do |child|
          Tag.build(child.tag, child.options) { child.content }
        end
        Tag.build(form.tag, form.options) { fields }
      end
    end
  end
end
