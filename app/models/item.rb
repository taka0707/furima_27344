class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  validates :title, :text, :genre, presence: true

  with_options numericality: { other_than: 1 } do
    validates :genre_id
  end
end
