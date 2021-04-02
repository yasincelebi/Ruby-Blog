class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history,:finders]
  belongs_to :author

=begin
dependent: :destroy ' postu sildiğimizde bağımlılıklarını da silmemizi sağlıyor
(https://stackoverflow.com/questions/34229264/cannot-delete-or-update-a-parent-row-a-foreign-key-constraint-fails-deleting)
=end
  validates_presence_of :title, :description
	validates_length_of :description, within: 50..250
  has_many :elements, dependent: :destroy
  has_one_attached :header_image
  scope :published, -> do
    where(published:1)
  end

  scope :most_recently_published, -> do
    order(published_at: :desc)
  end
  def should_generate_new_friendly_id?
    title_changed?
  end
end
