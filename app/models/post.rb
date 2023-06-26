class Post < ApplicationRecord
  belongs_to :category, optional: true
  enum highlight: { main: 0, secondary: 1 }

  scope :main, -> { where(highlight: :main).order(publication_date: :desc) }
  scope :published, -> { where("publication_date <= ?", Time.now) }
end
