# Генератор форм
[![hexlet-check](https://github.com/Malcom1986/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Malcom1986/rails-project-63/actions/workflows/hexlet-check.yml)
[![Ruby](https://github.com/Malcom1986/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/Malcom1986/rails-project-63/actions/workflows/main.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/47872a94b69bb0b2063e/maintainability)](https://codeclimate.com/github/Malcom1986/rails-project-63/maintainability)

Генератор Форм — библиотека, с помощью которой удобно создавать формы в шаблонах сайтов

Пример использования:

```ruby
User = Struct.new(:id, :name, :job)

user = User.new

html = HexletCode.form_for user, url: '/users' do |f|
  f.input :name
  f.input :job, as: :text
  f.submit
end

puts html
```

Результат:

```html
<form action="/users" method="post">
    <label for="name">Name</label>
    <input name="name" value="" type="text">
    <label for="job">Job</label>
    <textarea cols="20" rows="40" name="job"></textarea>
    <input type="submit" value="Create">
</form>
```