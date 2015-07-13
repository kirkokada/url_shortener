class Link < ActiveRecord::Base
  extend FriendlyId
  validates :url, uniqueness: true
  friendly_id :random_string, use: :slugged

  private

  def random_string
    [*('a'..'z'), *('A'..'Z')].sample(8).join
  end
end
