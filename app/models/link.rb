class Link < ApplicationRecord
  validates :title, presence: true
  belongs_to :user

  scope :hot, -> {
    select('links.url as url')
      .joins('join reads on reads.link_id = links.id')
      .where('reads.created_at > ?', Time.now - 1.day)
      .group("links.url")
      .order('count("reads".id) DESC').limit(10)
  }

  def self.top_ten_in_last_day
    where(read: true).where(updated_at: (Time.now - 24.hours)..Time.now).group(:url).limit(10).count
  end

end
