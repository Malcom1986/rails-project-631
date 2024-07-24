# frozen_string_literal: true

require 'test_helper'

describe 'single tag' do
  it 'should works without attributes' do
    assert { HexletCode::Tag.build 'br' == '<br>' }
    assert { HexletCode::Tag.build 'hr' == '<hr>' }
  end

  it 'should works with attributes' do
    actual1 = HexletCode::Tag.build('img', src: 'path/to/image')
    expected1 = '<img src="path/to/image">'
    assert { actual1 == expected1 }

    actual2 = HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    expected2 = '<input type="submit" value="Save">'
    assert { actual2 == expected2 }
  end
end

describe 'paired tag' do
  it 'should works without body and attributes' do
    assert { HexletCode::Tag.build('div') == '<div></div>' }
    assert { HexletCode::Tag.build 'span' == '<span></span>' }
  end

  it 'should works with attributes' do
    actual1 = HexletCode::Tag.build('label') { 'Email' }
    expected1 = '<label>Email</label>'
    assert { actual1 == expected1 }

    actual2 = HexletCode::Tag.build('label', for: 'email') { 'Email' }
    expected2 = '<label for="email">Email</label>'
    assert { actual2 == expected2 }
  end
end
