# frozen_string_literal: true

module HexletCode
  class Tag
    @single_tags = %w[area base br col hr img input link meta param source]

    def self.build(tag, attributes = {})
      attr_line = build_attr_line(attributes)
      attr_line = " #{attr_line}" unless attr_line.empty?
      open_tag = "<#{tag}#{attr_line}>"
      closing_tag = @single_tags.include?(tag) ? '' : "</#{tag}>"
      body = block_given? ? yield : ''
      [open_tag, body, closing_tag].join
    end

    def self.build_attr_line(attributes)
      attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
    end
  end
end
