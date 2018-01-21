class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  validates_presence_of :starting_bid

  def latest_bid
    self.bids.last
  end

  def current_price
    self.latest_bid && self.latest_bid.amount || self.starting_bid
  end

  def end_time
    self.created_at + 7.days
  end
end