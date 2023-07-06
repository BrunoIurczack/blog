class Post < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 250]
    attachable.variant :thumb_2, resize_to_limit: [100, 100]
    
  end

  belongs_to :category, optional: true
  enum highlight: { main: 0, secondary: 1 }

  scope :main, -> { where(highlight: :main).order(publication_date: :desc) }
  scope :published, -> { where("publication_date <= ?", Time.now) }
end
