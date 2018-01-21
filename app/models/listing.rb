class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  validates_presence_of :starting_bid
  validates_presence_of :title

  def self.current
    self.where("listings.created_at > datetime('now', '-7 days')")
  end

  def latest_bid
    # Force ActiveRecord to look at the data in the database so newly built bids are ignored
    self.bids.where("1=1").last
  end

  def current_price
    self.latest_bid && self.latest_bid.amount || self.starting_bid
  end

  def end_time
    self.created_at + 7.days
  end

  def over?
    self.end_time <= Time.now
  end
end