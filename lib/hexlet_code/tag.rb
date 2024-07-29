# frozen_string_literal: true

module HexletCode
  class Tag
    @single_tags = %w[area base br col hr img input link meta param source]

    def self.build(tag, attributes = {})
      attr_string = attributes.to_a.map do |(key, value)|
        "#{key}=\"#{value}\""
      end.join(' ')

      attr_string = " #{attr_string}" unless attr_string.empty?
      open_tag = "<#{tag}#{attr_string}>"
      closing_tag = @single_tags.include?(tag) ? '' : "</#{tag}>"
      body = block_given? ? yield : ''
      [open_tag, body, closing_tag].join
    end
  end
end
