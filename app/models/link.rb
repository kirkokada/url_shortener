class Link < ActiveRecord::Base
  validates :slug, uniqueness: true
  validate :slug_edit_distance_must_be_greater_than_one
  before_save :set_slug
  before_save :prepend_https
  scope :similar_slugs, -> (slug) { where('levenshtein(?, slug) <= 1', slug) }

  private

  def random_string
    [*('a'..'z'), *('0'..'9')].sample(8).join
  end

  def set_slug
    self.slug = random_string
    set_slug unless Link.similar_slugs(self.slug).count == 0
  end

  def slug_edit_distance_must_be_greater_than_one
    return if Link.similar_slugs(self.slug).count == 0
    errors.add(:slug, 'must differ from other slugs by more than 1 character')
  end

  def prepend_https
    return if url =~ %r{https:\/\/}
    self.url = 'https://' + url
  end
end
