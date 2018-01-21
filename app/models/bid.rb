class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  validates_presence_of :user_id
  validates_presence_of :listing_id
  validate :no_self_bidding
  validate :amount_higher_than_starting_bid

  def no_self_bidding
    if self.user == self.listing.user
      errors.add(:user_id, "can't bid on your own item :)")
    end    
  end

  def amount_higher_than_starting_bid
    if self.listing.starting_bid > self.amount
      errors.add(:amount, "bid must be higher than starting amount")
    end
  end
end