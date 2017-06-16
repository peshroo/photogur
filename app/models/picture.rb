class Picture < ActiveRecord::Base

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
end
