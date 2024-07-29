# frozen_string_literal: true

module HexletCode
  class Submit
    def initialize(value)
      @value = value
    end
    attr_reader(:value)

    def to_html
      Tag.build('input', type: 'submit', value:)
    end
  end
end
