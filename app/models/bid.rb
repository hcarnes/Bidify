class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  validates_presence_of :user_id
  validates_presence_of :listing_id
  validate :no_self_bidding

  def no_self_bidding
    if self.user == self.listing.user
      errors.add(:user_id, "can't bid on your own item :)")
    end    
  end
end