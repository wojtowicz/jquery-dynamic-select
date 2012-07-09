# jQueryDynamicSelect

TODO: Write a gem description in English

Gem pozwalający na utworzenie dwóch powiązanych ze sobą rozwijanych list wyboru (selecty), gdzie po zmianie zaznaczenia opcji w liście pierwszej doładowane zostaną metodą AJAX odpowiednie dane do listy drugiej.



## Installation

Add this line to your application's Gemfile:

    gem 'jquery_dynamic_select', :path => 'path_to_the_gem'

And then execute:

    $ bundle

## USAGE

# Model

Mamy przykładowe dwa powiązane ze sobą modele Brand (marka samochodu) oraz Model (model samochodu)

```ruby
# == Schema Information
#
# Table name: brands
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Brand < ActiveRecord::Base
end
```

```ruby
# == Schema Information
#
# Table name: models
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  brand_id   :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Model < ActiveRecord::Base
  belongs_to :brand
  has_many :cars
end
```

# Controller

W kontrolerze należy dodać

```ruby
class CarsController < ApplicationController
  dynamic_select :brand, :model
  ...
end
```
Pierwszym parametrem jest nazwa pola na którego zmianę ma reagować gem, natomiast drugi parametr określa pole do którego mają zostać przysłane dane. 

Trzeba jeszcze do routingu dodać

```ruby
get :dynamic_select_brand_models, :on => :collection
end
```
# TODO: Opisać trzeci parametr wywołania dynamic_select w kontrolerze

# Widok

Pierwszy select tworzymy normalnie natomiast drugi tworzymy w ten sposób:

```ruby
<%= form_for @car do |f| %>
<%= f.select :brand_id, options_for_select(Brand.find(:all).collect { |brand| [brand.name, brand.id] } %>
<%= f.dynamic_select(:model_id, dynamic_select_brand_models_cars_path, :brand_id %>
<% end %>
```
Opis parametrów helpera dynamic_select:

1. Nazwa pola
2. Adres na który ma zostać wysłane żądanie AJAX
3. Nazwa pola, po którego zmianie zaznaczenia ma zostać wysłane żądanie
4. Reszta normalnie...

## TODO

* Write some tests!

