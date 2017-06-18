class Picture < ActiveRecord::Base

  validates :artist, :url, presence: true
  validates :title, length: {minimum: 3, maximum: 20}
  validates :url, uniqueness: true

  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  def self.older_than_one_month
    Picture.where("created_at < ?", 1.months.ago)
  end

  def self.pictures_created_in_year(year)
    start_year = DateTime.new(year)
    end_year = DateTime.new(year).end_of_year
    Picture.where("created_at < ?", year)
  end

end
