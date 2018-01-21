class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  validates_presence_of :starting_bid

  def latest_bid
    self.bids.last
  end
end