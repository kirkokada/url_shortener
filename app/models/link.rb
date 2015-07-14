class Link < ActiveRecord::Base
  validates :url, uniqueness: true
  validates :slug, uniqueness: true
  validate :slug_edit_distance_must_be_greater_than_one
  before_save :set_slug

  private

  def random_string
    [*('a'..'z'), *('0'..'9')].sample(8).join
  end

  def set_slug
    self.slug = random_string
    set_slug unless Link.where('levenshtein(?, slug) <= 1', self.slug).count == 0
  end

  def slug_edit_distance_must_be_greater_than_one
    unless Link.where('levenshtein(?, slug) <= 1', self.slug).count == 0
      errors.add(:slug, 'must differ from other slugs by more than 1 character')
    end
  end
end
