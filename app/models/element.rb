class Element < ApplicationRecord
  belongs_to :post
  #eklenebilecek element türleri
  validates :element_type, inclusion: {in: ['paragraph', 'image', 'embed-video']}

  has_rich_text :content
  has_one_attached :image

  def paragraph?
    element_type == 'paragraph'
  end

  def image?
    element_type == 'image'
  end
end
