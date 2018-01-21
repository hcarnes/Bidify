class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  validates_presence_of :user_id
  validates_presence_of :listing_id
  validate :no_self_bidding
  validate :amount_higher_than_current_price
  validate :auction_isnt_over

  def no_self_bidding
    if self.user == self.listing.user
      errors.add(:user_id, "can't bid on your own item :)")
    end    
  end

  def amount_higher_than_current_price
    if !self.amount || self.listing.current_price > self.amount
      errors.add(:amount, "must be higher than current price")
    end
  end

  def auction_isnt_over
    # if end time is in the past, add error
    if self.listing.over?
      errors.add(:base, "auction is over")
    end
  end
end