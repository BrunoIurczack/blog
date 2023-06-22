class Post < ApplicationRecord
  belongs_to :category, optional: true
  enum highlight: { main: 0, secondary: 1 }
end
