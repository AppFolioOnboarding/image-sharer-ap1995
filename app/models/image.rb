class Image < ApplicationRecord
  validates :link, presence: true
  validates :link, format: URI.regexp(%w[http https])
end
