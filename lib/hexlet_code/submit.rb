# frozen_string_literal: true

module HexletCode
  class Submit
    def initialize(value)
      @tag = 'input'
      @type = 'submit'
      @content = nil
      @options = get_options(value)
    end
    attr_reader(:tag, :type, :options, :content)

    def get_options(value)
      value ||= 'Save'
      { type:, value: }
    end
  end
end
