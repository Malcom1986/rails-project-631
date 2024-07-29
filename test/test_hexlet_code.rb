# frozen_string_literal: true

require 'test_helper'

class PostTest < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def read_fixture(file_name)
    filename = "#{file_name}.html"
    fixture_path = File.join(__dir__, 'fixtures', filename)
    File.read(fixture_path).strip
  end

  # def test_form_builder_with_empty_fields
  #   actual = HexletCode.form_for @user do |f|
  #   end
  #   expected = read_fixture('empty_form_wo_url')
  #   assert { actual == expected }
  # end

  # def test_form_builder_with_empty_fields_w_url
  #   actual = HexletCode.form_for @user, url: '/users' do |f|
  #   end
  #   expected = read_fixture('empty_form_w_url')
  #   assert { actual == expected }
  # end

  def test_form_builder_with_fields
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end
    expected = read_fixture('form_with_fields')
    assert { actual == expected }
  end

  def test_form_builder_with_extra_attributes
    actual = HexletCode.form_for @user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    expected = read_fixture('form_with_fields_attr')
    assert { actual == expected }
  end

  def test_form_builder_with_redifine_defaults
    actual = HexletCode.form_for @user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    expected = read_fixture('form_with_redifine_defaults')
    assert { actual == expected }
  end

  def test_form_builder_with_full_form
    actual = HexletCode.form_for @user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end
    expected = read_fixture('full_form')
    assert { actual == expected }
  end
end
