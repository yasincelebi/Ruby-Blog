class Element < ApplicationRecord
  belongs_to :post
  #eklenebilecek element türleri
  validates :element_type, inclusion: {in: ['paragraph', 'image', 'embed-video']}
end
