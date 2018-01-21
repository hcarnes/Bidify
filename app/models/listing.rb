class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  def latest_bid
    self.bids.last
  end
end